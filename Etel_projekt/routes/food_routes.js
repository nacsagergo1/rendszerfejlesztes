const express = require("express");
const fs = require('fs');
const FoodDAO = require("../dao/food_dao");
const { errorMonitor } = require("nodemailer/lib/xoauth2");
const path = require('path');
const multer = require('multer');
const sharp = require('sharp');
const { error } = require("console");
const storage = multer.diskStorage({
    destination: function(req, file, cb) {
      cb(null, path.join(__dirname, '../public/img/Food_pics'));
    },
    filename: function (req, file, cb) {
        cb(null, Date.now() + path.extname(file.originalname));
    }
  });
  
const upload = multer({ 
    storage: storage,
    fileFilter: (req, file, cb) =>{
        const filetypes = /jpeg|jpg|png/;
        const mimetype = filetypes.test(file.mimetype);
        const extname = filetypes.test(path.extname(file.originalname).toLowerCase());
        if (mimetype && extname) {
            return cb(null, true);
        } else {
            cb('Hiba: Képformátum nem megfelelő');
        }
    }
});

const router = express.Router();


router.post('/deleteFood', async (req, res) => {
    const foodId = req.body.foodId;
    const user = req.session.user;

    console.log("deleteFood: eléri a route-ot", foodId);

    if(!user || user.role != 'admin'){
        res.redirect('menu');
        return res.render('menu', {error: 'Nincs jogosultság!'});
    }

    try {
        const image = await FoodDAO.getImagePath(foodId);

        if(!image){
            return res.status(404).json({ success: false, error: "Az étel nem található"});
        }
        const imagePath = path.join(__dirname, '../public', image);

        console.log("deleteFood: megvan a kép");

        if (fs.existsSync(imagePath)) {
            fs.unlinkSync(imagePath);
        }
        console.log("deleteFood: étel törlése...");
        const resultmenu = await FoodDAO.deleteFoodFromMenu(foodId);
        const resultfood = await FoodDAO.deleteFood(foodId);

        if(resultfood && resultmenu){
            console.log("deleteFood: Sikeresen törölte a kaját");
            res.json({ success: true, message: 'Az étel sikeresen törölve!'});
        } else {
            console.log("deleteFood: nem sikerült törölni a kaját");
            res.status(404).json({ success: false, error: 'Az étel nem található vagy nem sikerült a törlése.'});
        }
    } catch (error) {
        console.log("deleteFood: nem törölte a kaját db hiba miatt");
        res.status(500).json({ success: false, error: 'Hiba történt az étel törlése során.'});
    }
});

router.post('/addFood', upload.single('image_path'), async (req, res) => {
    const user = req.session.user;
    let { name, description, category, price} = req.body;

    if(!user || user.role != 'admin'){
        return res.status(403).json({ success: false, error: 'Nincs jogosultság!'});
    }

    if(name.trim() == "" || category.trim() == "" || description.trim() == "" || price.trim() == 0){
        return res.status(404).json({ success: false, error: 'Hiányzó mező!'});
    }

    if(!req.file){
        return res.status(404).json({ success: false, error: 'Hiányzó kép.'});
    }

    const image_path = `img/Food_pics/${req.file.filename}`;

    console.log("addFood: Eljut az adatok leelenőrzéséig");


    try {
        const foodCreated = await FoodDAO.createFood(name, description, category, price, image_path);

        if(!foodCreated){
            console.log("addFood: Nem hozta létre a db a kaját.");
            return res.json({success: false, error: "Hiba az étel mentése során"});
        } else {
            console.log("addFood: Db létre hozta a kaját");
            return res.json({success: true, error: "Az étel hozzáadása sikeres volt"});
        }
    } catch (error){
        console.log("addFood: DB error, nem hozta létre a kaját: ", error);
        return res.status(500).json({success: false, error: "Hiba az étel mentése során"});
    }
});

module.exports = router;