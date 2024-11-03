const connection = require('../config/db');

//TODO: database connection test query: change to reservation CRUD
/*
To test in index.js:
const reservations = require('./dao/reservation_dao');
reservations.listFoodNames();

function listFoodNames() {
    connection.query('SELECT name FROM food', (err, results) => {
      if (err) {
        console.error('Lekérdezés hiba: ' + err.stack);
        return;
      }
  
      // Eredmények kiírása
      console.log('Ételek nevei:');
      results.forEach((row) => {
        console.log(row.name);
      });
    });
}

module.exports = { listFoodNames };*/

class ReservationDAO{

  constructor() {}

  async createReservation(ID, userID, resDate, expPartySize, business){

    const [existing] = await connection.query('SELECT * FROM reservations WHERE ID = ? and User_ID = ?', [ID, userID]);

    if(existing.length > 0){
        return false;
    } else {
        try{
            const [result] = await connection.query('INSERT INTO users (ID, User_ID, Reservation_Date, Expected_Party_Size, Business) VALUES (?, ?, ?, ?, ?, ?)', [ID, userID, resDate, expPartySize, business]);
            
            if(result && result.affectedRows === 1){
                return true;
            } else {
                return false;
            }
        } catch (error){
            console.log("Failed reservation: ", error);
            return false;
        }
    }   
  }

  async getFreeTables(date) {
    try {
        const [rows] = await connection.query(
            `SELECT tables.ID AS Table_ID, tables.Capacity
             FROM tables
             WHERE tables.ID NOT IN (
                 SELECT reservations_tables.Table_ID
                 FROM reservations_tables
                 JOIN reservations ON reservations.ID = reservations_tables.Reservation_ID
                 WHERE reservations.Reservation_Date = ?
             );`,
            [date]
        );

        return rows;
    } catch (error) {
        console.error('Hiba történt a lekérdezés során:', error);
        throw error;
    }
  }


}


module.exports = ReservationDAO;