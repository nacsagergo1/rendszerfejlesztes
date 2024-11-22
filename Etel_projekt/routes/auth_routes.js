const express = require('express');
const bcrypt = require('bcrypt');
const router = express.Router();
const { sendValidationEmail, sendPasswordResetEmail } = require('../services/authService'); 
const UserDAO = require('../dao/user_dao');
const {findCode,deleteCode} = require('../dao/oneTimeCode_dao'); 

router.get('/validate', async (req, res) => {
    const code = req.query.code; 

    if (!code) {
        return res.status(400).send("Hibás vagy hiányzó kód."); 
    }

    try {
       
        const record = await findCode(code); 
        if (!record) {
            return res.status(404).send("Érvénytelen kód.");
        }

       
        await  new UserDAO().validateUser(record.User_ID); 
        await deleteCode(code); 

        
        res.render('validation_success', { message: "A fiók sikeresen aktiválva!" });
    } catch (error) {
        console.error("Validation error:", error);
        res.status(500).send("Hiba történt az érvényesítés során.");
    }
});

router.get('/reset-password', async (req, res) => {
  const code = req.query.code; 

  if (!code) {
    return res.status(400).send("Hibás vagy hiányzó kód."); 
  }

  try {
   
    const record = await findCode(code); 
    if (!record) {
      return res.status(404).send("Érvénytelen kód."); 
    }

    
    const newPassword = Math.random().toString(36).slice(-8);
    
    let hash = await bcrypt.hash(newPassword, 10);
    
    await new UserDAO().updatePassword(record.User_ID, hash); 

    
    res.render('reset_success', { message: `Az új jelszó: ${newPassword}` });
  } catch (error) {
    console.error("Password reset error:", error);
    res.status(500).send("Hiba történt a jelszó visszaállítás során.");
  }
});



module.exports = router;
