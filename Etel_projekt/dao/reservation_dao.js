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

  async createReservation(userID, resDate, expPartySize, business, tableID){

    const [existing] = await connection.query('SELECT * FROM reservations WHERE Reservation_Date = ? and User_ID = ?', [resDate, userID]);
    const [existing_user] = await connection.query('SELECT * FROM users WHERE ID = ?', [userID]);

    if(existing.length > 0 || existing_user.length < 1){
      console.error("Failed reservation create");
      return false;
    }else {
      try{
        const [result] = await connection.query('INSERT INTO reservations (User_ID, Reservation_Date, Expected_Party_Size, Business) VALUES (?, ?, ?, ?)', [userID, resDate, expPartySize, business]);
        const reservation_ID = result.insertId;

            
        for(let i = 0; i < tableID.length; i++){
          const [resultConnected] = await connection.query('INSERT INTO reservations_tables (Reservation_ID, Table_ID) VALUES (?, ?)', [reservation_ID ,tableID[i]]);
          if(result && result.affectedRows === 1){
            continue;
          } else {
            return false;
          }
        }

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