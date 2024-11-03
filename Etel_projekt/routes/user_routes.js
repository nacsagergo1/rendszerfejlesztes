const express = require("express");
const router = express.Router();
const bcrypt = require('bcrypt');
const jwt = require("jsonwebtoken");
const UserDAO = require("../dao/user_dao");

router.post('/registerUser', (req, res)=>{
    let username = req.body.username;
    let email = req.body.email;
    let passwd = req.body.password;
    let passwd_conf = req.body.confirm-password;

    if(email.trim() === "" || username.trim() === "" || passwd.trim() === "" || passwd_conf.trim() === ""){
        return res.status(400).send("Hiányzó mező!");
    }

    if(!email.includes("@")){
        return res.status(400).send("Nem megfelelő email cím formátum");
    }

    if(passwd !== passwd_conf){
        return res(400).send("A jelszó és a megerősítés nem egyezik!");
    }

    let validated = 0;
    let salt = "";
    

    let now = new Date();
    let year = now.getFullYear();
    let month = (now.getMonth() + 1).toString().padStart(2, '0');
    let day = now.getDate().toString().padStart(2, '0');
    let hours = now.getHours().toString().padStart(2, '0');
    let minutes = now.getMinutes().toString().padStart(2, '0');
    let secs = now.getSeconds().toString().padStart(2, '0');

    let reg_date = `${year}-${month}-${day} ${hours}:${minutes}:${secs}`;
    

    let user;

    bcrypt.hash(password, 10).then(async (hash) => {
        user = await new UserDAO().createUser(email, hash, validated, reg_date, salt)
    });

    if(!user){
        return res.status(400).send("Ezzel az e-mail címmel már van fiók!");
    } else {
        return res.redirect('/login');
    }

});

router.post('/loginUser', (req, res)=>{
    //TODO
});

module.exports = router;