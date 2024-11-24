const express = require("express");
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

router.get('/getFoods', async (req, res) => {
    try{
        const foods = await new FoodDAO().getFoods();
        if(foods){
            res.json({ foods });
        } else {
            res.status(500).json({success: false, error: 'Hiba történt az ételek betöltése közben.'});
        }
    } catch (error){
        res.status(500).json({  success: false, message: 'Hiba történt: ', error: error.message});
    }
});

router.get('/getFoodByCategory/:category', async(req, res) => {
    const category = req.params.category;

    try{
        const foodlist = await new FoodDAO().getFoodsByCategory(category);

        if(foodlist){
            res.json({ foodlist });
        } else {
            res.status(404).json({ success: false, error: 'Hiba az ételek lekérdezése közben: '});
        }
    } catch (error) {
        res.status(500).json({ success: false, error: 'Hiba az ételek betöltése során: '});
    }
});

router.delete('/deleteFood/:foodId', async (req, res) => {
    const foodId = req.params.foodId;
    const user = req.session.user;

    if(!user || user.role != admin){
        res.redirect('menu');
        return res.render('menu', {error: 'Nincs jogosultság!'});
    }

    try {
        const resultfood = await new FoodDAO().deleteFood(foodId);
        const resultmenu = await new FoodDAO().deleteFoodFromMenu(foodId);

        if(resultfood && resultmenu){
            res.json({ success: true, message: 'Az étel sikeresen törölve!'});
        } else {
            res.status(404).json({ success: false, error: 'Az étel nem található vagy nem sikerült a törlése.'});
        }
    } catch (error) {
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
            return res.redirect('menu');
        }
    } catch (error){
        console.log("addFood: DB error, nem hozta létre a kaját: ", error);
        return res.status(500).json({success: false, error: "Hiba az étel mentése során"});
    }
});

router.get('/getMenus', async (req, res) => {
    try{
        const menus = await new FoodDAO().getMenus();

        if(menus){
            res.json({ menus });
        } else {
            res.status(404).json({ success: false, error: 'Hiba a menük lekérdezése közben'});
        }
    } catch (error){
        return res.status(500).json({success: false, error: "Hiba a menük betöltése során."});
    }
});

module.exports = router;