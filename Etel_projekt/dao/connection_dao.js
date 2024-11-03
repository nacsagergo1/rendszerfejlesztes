const mysql = require('mysql');

// Kapcsolat létrehozása egy pool-lal
const pool = mysql.createPool({
  host: 'localhost',
  port: 3306,
  user: 'root',  
  password: '', 
  database: 'etel',  
  connectionLimit: 10 
});

module.exports = pool;