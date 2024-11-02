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

module.exports = router;