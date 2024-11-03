const express = require("express");
const router = express.Router();
const jwt = require("jsonwebtoken");


router.get('/', (req, res)=>{
    return res.render('home');
});

router.get('/login', (req, res)=>{
    return res.render('login');
});

router.get('/register', (req, res)=>{
    return res.render('registration');
});

router.get('/reserve', (req, res)=>{
    return res.render('reserve');
});

router.get('/menu', (req, res)=>{
    return res.render('menu');
});

router.get('/reviews', (req, res)=>{
    return res.render('reviews');
});

router.get('/contact', (req, res)=>{
    return res.render('contact');
});

module.exports = router;