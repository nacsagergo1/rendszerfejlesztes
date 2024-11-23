const express = require("express");
const router = express.Router();
const bcrypt = require('bcrypt');
const jwt = require("jsonwebtoken");
const UserDAO = require("../dao/user_dao");
const { sendValidationEmail, sendPasswordResetEmail } = require('../services/authService');





// Regisztráció
router.post('/registerUser', async (req, res) => {
    let { username, email, password, confirm_password } = req.body;
    let admin = 0;

    if (email.trim() === "" || username.trim() === "" || password.trim() === "" || confirm_password.trim() === "") {
        return res.render('registration', { error: "Hiányzó mező!" });
    }

    if (
        !email.includes("@") || 
        !email.includes(".") || 
        email.indexOf("@") > email.lastIndexOf(".") || 
        email.indexOf(".") === email.indexOf("@") + 1 || 
        email.lastIndexOf(".") >= email.length - 1
    ){
        return res.render('registration', { error: "Nem megfelelő e-mail cím formátum!" });
    }

    if (password !== confirm_password) {
        return res.render('registration', { error: "A jelszó és a megerősítése nem egyezik!" });
    }

    let validated = 0;
    let now = new Date();
    let reg_date = `${now.getFullYear()}-${(now.getMonth() + 1).toString().padStart(2, '0')}-${now.getDate().toString().padStart(2, '0')} ${now.getHours().toString().padStart(2, '0')}:${now.getMinutes().toString().padStart(2, '0')}:${now.getSeconds().toString().padStart(2, '0')}`;
    
    try {
        const hash = await bcrypt.hash(password, 10);
        const userCreated = await new UserDAO().createUser(email, hash, username, validated, reg_date,  admin);
        
        
        
        if (!userCreated) {
            return res.render('registration', { error: "Ezzel az e-mail címmel már van fiók regisztrálva!" });
        } else {
            
            try{
            await sendValidationEmail(email);
        }catch(error){throw error;}
            
            return res.redirect('/login');
        }
    } catch (error) {
        console.error("Hiba történt a regisztráció során:", error);
        return res.render('registration', { error: "Hiba a regisztrálás során!" });
    }
});

// Bejelentkezés
router.post('/loginUser', async (req, res) => {
    let { email, password } = req.body;

    if (email.trim() === "" || password.trim() === "") {
        return res.render('login', { error: "Üres mező!" });
    }

    if (!email.includes("@")) {
        return res.render('login', { error: "Nem megfelelő e-mail cím formátum!" });
    }

    try {
        const user = await new UserDAO().loginUser(email);

        if (!user) {
            return res.render('login', { error: "Nincs ilyen felhasználó!" });
        }

        const match = await bcrypt.compare(password, user.Hash);

        if (match) {
            req.session.user = {
                id: user.ID,
                email: user.Email_Address,
                role: user.Admin ? 'admin' : 'user',
            };

            return res.redirect('/');
        } else {
            return res.render('login', { error: "Sikertelen bejelentkezés" });
        }
    } catch (error) {
        return res.render('login', { error: "Hiba a bejelentkezés során!" + error.message });
    }
});

// Kijelentkezés
router.get('/logout', (req, res) => {
    req.session.destroy((error) => {
        if (error) {
            return res.redirect('/'); // Ha hiba van, irányítsuk a főoldalra
        }

        res.clearCookie('connect.sid');
        res.redirect('/login');
    });
});

//elfelejtet jelszó
router.post('/password-reset', async (req, res) => {
    const { email } = req.body; 
    
    try {
        
        const user = await new UserDAO().getUserByEmail(email); 
                
        if (!user) {
            return res.status(400).send('User not found.');
        }

        
        await sendPasswordResetEmail(email); 

        res.status(200).send('Password reset email sent.');
    } catch (error) {
        console.error('Password reset failed:', error);
        res.status(500).send('Error during password reset.');
    }
});

// Admin felhasználók listázása
router.get('/list-users', async (req, res) => {
    const user = req.session.user;

    if (!user || user.role !== 'admin') {
        return res.status(403).json({ message: 'No permission!' });
    }

    try {
        const users = await new UserDAO().listUsers(user);

        if (users) {
            res.json({ users });
        } else {
            console.log("Adatbázis van, de mégsem működik a users-list");
            res.status(500).json({ message: 'Nem sikerült lekérdezni a felhasználókat.' });
        }
    } catch (error) {
        console.error('Hiba történt a list-users kérésnél:', error);
        res.status(500).json({ message: 'Hiba történt.', error: error.message || error });
    }
});

router.post('/modifyUser', async (req, res) => {
    const user = req.session.user;

    // Jogosultság ellenőrzése
    if (!user) {
        return res.status(403).json({ message: 'Nincs jogosultság.' });
    }

    const userId = req.query.userId;
    const newUsername = req.query.newUsername;

    // Paraméterek meglétének ellenőrzése
    if (!userId || !newUsername) {
        return res.status(400).json({ message: 'Hiányzó userId vagy newUsername paraméter.' });
    }

    try {
        // Username módosítása
        const updateSuccess = await updateUsername(userId, newUsername);

        if (updateSuccess) {
            res.json({ message: 'Felhasználónév sikeresen módosítva.' });
        } else {
            res.status(500).json({ message: 'Nem sikerült módosítani a felhasználónevet.' });
        }
    } catch (error) {
        console.error('Hiba történt a felhasználónév módosításakor:', error);
        res.status(500).json({ message: 'Hiba történt.', error: error.message || error });
    }
});

// Felhasználó törlése
router.delete('/delete-user/:userId', async (req, res) => {
    const user = req.session.user;
    const userId = req.params.userId;

    if (!user || (user.role !== 'admin' && user.id !== parseInt(userId))) {
        return res.status(403).json({ message: 'Nincs jogosultság.' });
    }

    try {
        await new UserDAO().clearUserReservations(userId);
        const result = await new UserDAO().deleteUser(userId);

        if (result) {
            res.json({ message: 'A felhasználó sikeresen törölve.' });
        } else {
            res.status(404).json({ message: 'A felhasználó nem található, vagy nem sikerült törölni.' });
        }
    } catch (error) {
        res.status(500).json({ message: 'Hiba történt a törlés során.', error });
    }
});

module.exports = router;