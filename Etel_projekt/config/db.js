const mysql = require('mysql2');

const pool = mysql.createPool({
  host: 'localhost',
  port: 3306, 
  user: 'root',
  database: 'projectg_asztalfoglalos3',  
}).promise();

module.exports = pool;
