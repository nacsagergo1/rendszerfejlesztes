const connection = require('./connection_dao');

//TODO: database connection test query: change to reservation CRUD
/*
To test in index.js:
const reservations = require('./dao/reservation_dao');
reservations.listFoodNames();
*/ 
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

module.exports = { listFoodNames };
