const mysql = require('mysql');

const pool = mysql.createPool({
  host: 'localhost',
  port: 3306,
  user: 'root',  
  password: '', 
  database: 'projectg_Asztafoglalos3',  
  connectionLimit: 10 
});

module.exports = pool;