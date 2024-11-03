const db = require('../config/db');

class UserDAO {

    async createUser(email, passwd, validated, reg_date, salt){

        let existing = await db.query('SELECT * FROM users WHERE Email_Address = $1', [email]);

        if(existing.rows.length > 0){
            return false;
        }

        await db.query('INSERT INTO users (Email_Address, Hash, Salt, Validated, Registration_Date) VALUES ($1, $2, $3, $4, $5)'
            , [email, passwd, salt, validated, reg_date]).catch(console.log);
            return true;
    }

    async loginUser(email, passwd){
        //TODO
    }

};

module.exports = UserDAO;