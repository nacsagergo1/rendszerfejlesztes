const mysql = require('mysql2');

const pool = mysql.createPool({
  host: 'localhost',
  port: 3306,
  user: 'root',  
  password: '', 
  database: 'projectg_asztalfoglalos3',  
  connectionLimit: 10 
}).promise();

module.exports = pool;
