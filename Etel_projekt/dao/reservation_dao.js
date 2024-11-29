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

  async listReservation(user){
    if (user.role === 'admin') {
      try {
        const [rows] = await connection.query(
          `SELECT * FROM reservations`
        );
  
        return rows;
      }catch (error) {
        console.error('Hiba történt a lekérdezés során:', error);
        throw error;
      }
    }else{
      try {
        const [rows] = await connection.query(
          `SELECT * FROM reservations WHERE reservations.User_ID = ?;`,
          [user.id]
        );
  
        return rows;
      }catch (error) {
        console.error('Hiba történt a lekérdezés során:', error);
        throw error;
      }
    }
  }

  async updateReservation(reservationID, newResDate, newPartySize) {
    try {
        const [existingReservation] = await connection.query('SELECT * FROM reservations WHERE ID = ?', [reservationID]);

        if (existingReservation.length === 0) {
            console.error("Reservation not found!");
            return false;
        }

        const [updateResult] = await connection.query(
            'UPDATE reservations SET Reservation_Date = ?, Expected_Party_Size = ? WHERE ID = ?',
            [newResDate, newPartySize, reservationID]
        );

        if (updateResult.affectedRows > 0) {
            return true;
        } else {
            return false;
        }
    } catch (error) {
        console.error("Error updating reservation: ", error);
        return false;
    }
  }

  async deleteTablesFromReservation(reservation_ID, tableID) {
    for (let i = 0; i < tableID.length; i++) {
        const [existingRecord] = await connection.query(
            'SELECT 1 FROM reservations_tables WHERE Reservation_ID = ? AND Table_ID = ?',
            [reservation_ID, tableID[i].ID]
        );

        if (existingRecord.length === 0) {
            continue;
        }

        const [resultDeleted] = await connection.query(
            'DELETE FROM reservations_tables WHERE Reservation_ID = ? AND Table_ID = ?',
            [reservation_ID, tableID[i].ID]
        );

        if (resultDeleted && resultDeleted.affectedRows === 1) {
            continue;
        } else {
            return false;
        }
    }
    return true;
  }

  async addTableToReservation(reservation_ID,tableID) {
    for (let i = 0; i < tableID.length; i++) {
        const [existingRecord] = await connection.query(
            'SELECT 1 FROM reservations_tables WHERE Reservation_ID = ? AND Table_ID = ?',
            [reservation_ID, tableID[i]]
        );

        if (existingRecord.length > 0) {
            continue;
        }

        const [resultConnected] = await connection.query(
            'INSERT INTO reservations_tables (Reservation_ID, Table_ID) VALUES (?, ?)',
            [reservation_ID, tableID[i]]
        );

        if (resultConnected && resultConnected.affectedRows === 1) {
            continue;
        } else {
            return false;
        }
    }
    return true;
}

  async getReservation(reservationID){
    try {
      const [rows] = await connection.query(
        `SELECT * FROM reservations WHERE reservations.ID = ?`,
        [reservationID]
      );

      return rows;
    }catch (error) {
      console.error('Hiba történt a lekérdezés során:', error);
      throw error;
    }
  }

  async getTablesFromReservation(reservationID){
    try {
      const [rows] = await connection.query(
          `SELECT tables.ID, tables.Capacity FROM tables 
          INNER JOIN reservations_tables ON reservations_tables.Table_ID = tables.ID 
          WHERE reservations_tables.Reservation_ID = ?
          ORDER BY tables.Capacity ASC;`,
          [reservationID]
      );

      return rows;
    } catch (error) {
      console.error('Hiba történt a lekérdezés során:', error);
      throw error;
    }
  }

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

  async deleteReservation(reservationID) {
    try {
        
        const [existingReservation] = await connection.query('SELECT * FROM reservations WHERE ID = ?', [reservationID]);
  
        if (existingReservation.length === 0) {
            console.error("Reservation not found!");
            return false;
        }
  
        const [deleteTablesResult] = await connection.query('DELETE FROM reservations_tables WHERE Reservation_ID = ?', [reservationID]);
  
        if (deleteTablesResult.affectedRows > 0) {
            console.log("Tables deleted");
        } else {
            console.log("There were no tables");
        }
  
        const [deleteReservationResult] = await connection.query('DELETE FROM reservations WHERE ID = ?', [reservationID]);
  
        if (deleteReservationResult.affectedRows > 0) {
            console.log("Reservation deleted");
            return true;
        } else {
            console.log("Cant find reservation");
            return false;
        }
  
    } catch (error) {
        console.error("Error deleting reservation: ", error);
        return false;
    }
  }

  async createReview(userId, score, comment, reservationId) {
    try {
        const [existingReview] = await connection.query(
            `SELECT ID FROM reviews WHERE Reservation_ID = ?`,
            [reservationId]
        );

        if (existingReview.length > 0) {
            return false;
        }

        console.log('Értékek: ', userId, score, comment, reservationId);
        const [result] = await connection.query('INSERT INTO reviews (User_ID, Score, Comment, Reservation_ID) VALUES (?,?,?,?)', [userId, score, comment, reservationId]);


        if(result && result.affectedRows === 1){
          console.log('review: létre hozta a véleményt');
          return true;
        } else {
          console.log('review: nem hozta létre a véleményt');
          return false;
      }
    } catch (error) {
        console.error('Hiba történt a vélemény létrehozása során:', error);
        return false;
    }
  }

  async deleteReview(reservationId) {
    try {
        const [result] = await connection.query(
            `DELETE FROM reviews WHERE Reservation_ID = ?`,
            [reservationId]
        );

        return result.affectedRows > 0;
    } catch (error) {
        console.error('Hiba történt a vélemény törlése során:', error);
        throw error;
    }
  }

  async getTopReviews(limit = 5) {
    console.log("DAO: Most kéri le a review-okat");
    try {
        const [rows] = await connection.query(
            `SELECT r.ID, r.Score, r.Comment, r.Reservation_ID, u.Username AS user_name
             FROM reviews r
             JOIN users u ON r.User_ID = u.ID
             ORDER BY r.Score DESC, r.ID ASC 
             LIMIT ?`,
            [limit]
        );
        console.log("DAO: Lekérte a vélemények top-ot : ", rows);
        return rows;
    } catch (error) {
      console.log("DAO: Nem sikerült a top lekérése");
        console.error('Hiba történt a vélemények lekérése során:', error);
        return [];
    }
  }
  
  async getAverageScoreAndCount() {
    console.log("DAO: Most kéri le a review-okat");
    try {
        const [rows] = await connection.query(
            `SELECT ROUND(AVG(Score), 2) AS averageScore, COUNT(*) AS totalReviews FROM reviews`
        );

        console.log("DAO: lekérte a stat-ot: ", rows[0].averageScore, rows[0].totalReviews);

        return {
            averageScore: rows[0].averageScore,
            totalReviews: rows[0].totalReviews
        };
    } catch (error) {
      console.log("DAO: Nem kérte le a stat-okat");
        console.error('Hiba történt az adatok lekérése során:', error);
        throw error;
    }
  }

}

module.exports = ReservationDAO;