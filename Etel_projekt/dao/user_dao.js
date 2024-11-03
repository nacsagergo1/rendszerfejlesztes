const db = require('../config/db');

class UserDAO {

    async createUser(email, passwd, validated, reg_date, salt, admin){

        const [existing] = await db.query('SELECT * FROM users WHERE Email_Address = ?', [email]);

        if(existing.length > 0){
            return false;
        } else {
            try{
                const [result] = await db.query('INSERT INTO users (Email_Address, Hash, Salt, Validated, Registration_Date, Admin) VALUES (?, ?, ?, ?, ?, ?)', [email, passwd, salt, validated, reg_date, admin]);
                
                if(result && result.affectedRows === 1){
                    return true;
                } else {
                    return false;
                }
            } catch (error){
                console.log("Hiba a regisztrációkor: ", error);
                return false;
            }
        }   
    }

    async loginUser(email){
        try{
            const [user] = await db.query('SELECT * FROM users WHERE Email_Address = ?', [email]);

            if(user){
                return user[0];
            } else {
                return null;
            } 
        } catch (error){
            console.log("Hiba a bejelentkezéskor: ", error);
            throw error;
        }
    }

};

module.exports = UserDAO;