const express = require("express");
const router = express.Router();
const bcrypt = require('bcrypt');
const jwt = require("jsonwebtoken");
const UserDAO = require("../dao/user_dao");

router.post('/registerUser', async (req, res)=>{
    let {username} = req.body;
    let {email} = req.body;
    let {password} = req.body;
    let {confirm_password} = req.body;
    let admin = 0;

    if(email.trim() === "" || username.trim() === "" || password.trim() === "" || confirm_password.trim() === ""){
        return res.render('registration', {error: "Hiányzó mező!"});
    }

    if(!email.includes("@")){
        return res.render('registration', {error: "Nem megfelelő e-mail cím formátum!"});
    }

    if(password !== confirm_password){
        return res.render('registration', {error: "A jelszó és a megerősítése nem egyezik!"});
    }

    let validated = 0;
    let salt = "10";
    

    let now = new Date();
    let year = now.getFullYear();
    let month = (now.getMonth() + 1).toString().padStart(2, '0');
    let day = now.getDate().toString().padStart(2, '0');
    let hours = now.getHours().toString().padStart(2, '0');
    let minutes = now.getMinutes().toString().padStart(2, '0');
    let secs = now.getSeconds().toString().padStart(2, '0');

    let reg_date = `${year}-${month}-${day} ${hours}:${minutes}:${secs}`;
    
    try {
        const hash = await bcrypt.hash(password, 10);
        
        const userCreated = await new UserDAO().createUser(email, hash, validated, reg_date, salt, admin);

        if (!userCreated) {
            return res.render('registration', {error: "Ezzel az e-mail címmel már van fiók regisztrálva!"});
        } else {
            return res.redirect('/login');
        }
    } catch (error) {
        console.error("Hiba történt a regisztráció során:", error);
        return res.render('registration', {error: "Hiba a regisztrálás során!"});
    }

});

router.post('/loginUser', async (req, res)=>{
    let {email} = req.body;
    let {password} = req.body;

    if(email.trim() === "" || password.trim() === ""){
        return res.render('login', {error: "Üres mező!"});
    }

    if(!email.includes("@")){
        return res.render('login', {error: "Nem megfelelő e-mail cím formátum!"});
    }

    try{
        const user = await new UserDAO().loginUser(email);

        if(!user || user === 'undefined'){
            return res.render('login', {error: "Nincs ilyen felhasználó!"});
        } else {
        
            const match = await bcrypt.compare(password, user.Hash);

            if(match){
                req.session.user = {
                    email: user.Email_Address,
                    role: user.Admin ? 'admin' : 'user',
                };

                res.redirect('/');
            } else {
                return res.render('login', {error: "Sikertelen bejelentkezés"});
            }
        }
    } catch (error){
        return res.render('login', {error: "Hiba a bejelentkezés során!" + error.message });
    }

});

router.post('/logout', async (req, res)=>{
    req.session.destroy(error=>{
        if(error){
            return res.redirect('/') //ide majd a profil oldal kell
        }

        res.clearCookie('connect.sid');
        res.redirect('/login');
    })
});

module.exports = router;