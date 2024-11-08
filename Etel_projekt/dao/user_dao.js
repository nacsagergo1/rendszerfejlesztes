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

    async deleteUser(userId) {
        try {
            const [result] = await db.query('DELETE FROM users WHERE User_ID = ?', [userId]);

            if(result && result.affectedRows === 1) {
                return true;
            } else {
                return false;
            }
        } catch (error) {
            console.log("Hiba a törléskor: ", error);
            return false;
        }
    }

    async listUsers(user) {
        if (user.role !== "admin") {
            return null;
        }
        
        try {
            const [users] = await db.query('SELECT * FROM users');
            return users;
        } catch (error) {
            console.log("Hiba a felhasználók lekérdezésekor: ", error);
            return null;
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

    async clearUserReservations(userID) {
        try {
            const [existingReservations] = await connection.query('SELECT * FROM reservations WHERE User_ID = ?', [userID]);
    
            if (existingReservations.length === 0) {
                console.error("No reservations found for the specified User_ID!");
                return false;
            }
    
            const [updateResult] = await connection.query(
                'UPDATE reservations SET User_ID = 0 WHERE User_ID = ?',
                [userID]
            );
    
            if (updateResult.affectedRows > 0) {
                return true;
            } else {
                return false;
            }
        } catch (error) {
            console.error("Error updating reservations for User_ID: ", error);
            return false;
        }
    }

    async deleteFutureReservations() {
        try {
            const [futureReservations] = await connection.query(
                'SELECT ID FROM reservations WHERE User_ID = 0 AND Reservation_Date > CURDATE()'
            );
    
            if (futureReservations.length === 0) {
                console.log("Nincsenek törlendő foglalások.");
                return false;
            }
    
            const reservationIDs = futureReservations.map(reservation => reservation.ID);
    
            await connection.query(
                'DELETE FROM reservation_tables WHERE Reservation_ID IN (?)',
                [reservationIDs]
            );
    
            const [deleteResult] = await connection.query(
                'DELETE FROM reservations WHERE ID IN (?)',
                [reservationIDs]
            );
    
            if (deleteResult.affectedRows > 0) {
                console.log("A jövőbeni foglalások és kapcsolódó adatok törölve lettek.");
                return true;
            } else {
                console.error("Nem sikerült törölni a foglalásokat.");
                return false;
            }
        } catch (error) {
            console.error("Hiba történt a törlés során: ", error);
            return false;
        }
    }

};

module.exports = UserDAO;