const express = require("express");
const router = express.Router();
const FoodDAO = require("../dao/food_dao");

router.use((req, res, next) => {
    const validRoutes = ['/login', '/register', '/reserve', '/menu', '/reviews', '/contact', '/', '/usersAdmin', '/profile', '/logout','/validate','/password-reset','/reset-password', '/upload', '/addFood', '/deleteFood'];
    if (!validRoutes.includes(req.path)) {
        return res.redirect('/');
    }
    next();
});

router.get('/', (req, res) => {
    return res.render('home');
});

router.get('/login', (req, res) => {
    if (req.session.user) {
        return res.render('profile', { user: req.session.user });
    } else {
        return res.render('login');
    } 
});

router.get('/register', (req, res) => {
    if (req.session.user) {
        return res.render('profile', { user: req.session.user });
    } else {
        return res.render('registration');
    }
});

router.get('/reserve', (req, res) => {
    if (req.session.user) {
        return res.render('reserve'); 
    } else {
        return res.redirect('/login'); 
    }
});

router.get('/menu', async (req, res) => {
    try{

        const soups = await FoodDAO.getFoodsByCategory("Leves");
        const mainDishes = await FoodDAO.getFoodsByCategory("Főétel");
        const pastas = await FoodDAO.getFoodsByCategory("Tészta");
        const drinks = await FoodDAO.getFoodsByCategory("Ital");
        const desserts = await FoodDAO.getFoodsByCategory("Desszert");
        const gyros = await FoodDAO.getFoodsByCategory("Gyrosok");
        const poultry = await FoodDAO.getFoodsByCategory("Szárnyas ételek");
        const sides = await FoodDAO.getFoodsByCategory("Köretek");

        if(soups && mainDishes && pastas && drinks && desserts && gyros && poultry && sides){
            return res.render('menu', {soups, mainDishes, pastas, drinks, desserts, gyros, poultry, sides} );
        } else {
            return res.status(500).json({ success: false, message: "Hiba az ételek lekérdezése során"});
        }
    } catch (error){
        return res.status(500).json({ success: false, message: "Hiba az ételek lekérdezése során"});
    }
    
});

router.get('/reviews', (req, res) => {
    return res.render('reviews');
});

router.get('/contact', (req, res) => {
    return res.render('contact');
});

router.get('/usersAdmin', (req, res) => {
    if(req.session.user && req.session.user.role === 'admin'){
        return res.render('usersAdmin');
    } else {
        return res.render('home');
    }
    
});

router.get('/profile', (req, res) => {
    if (req.session.user) {
        return res.render('profile', { user: req.session.user });
    } else {
        return res.redirect('/login');
    }
});




module.exports = router;