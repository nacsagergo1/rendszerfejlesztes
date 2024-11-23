const express = require("express");
const FoodDAO = require("../dao/food_dao");
const { errorMonitor } = require("nodemailer/lib/xoauth2");
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

router.post('/addFood', async (req, res) => {
    const user = req.session.user;
    let { name, description, category, price, image_path} = req.body;

    if(!user || user.role != 'admin'){

    }

    if(name.trim() == "" || category.trim == "" || description.trim() == "" || price.trim() == 0 || image_path.trim() == ''){
        return res.render('profile', {error: 'Hiányzó adat.'});
    }

    try {
        const foodCreated = await new FoodDAO.createFood(name, description, category, price, image_path);

        if(!foodCreated){
            return res.json({success: false, error: "Hiba az étel mentése során"});
        } else {
            return res.json({ success: true});
        }
    } catch (error){
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