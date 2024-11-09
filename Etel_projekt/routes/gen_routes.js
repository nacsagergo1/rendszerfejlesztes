const express = require("express");
const router = express.Router();

router.use((req, res, next) => {
    const validRoutes = ['/login', '/register', '/reserve', '/menu', '/reviews', '/contact', '/', '/usersAdmin', '/profile', '/logout'];
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

router.get('/menu', (req, res) => {
    return res.render('menu'); 
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