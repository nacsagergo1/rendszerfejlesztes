const mysql = require('mysql2');

const pool = mysql.createPool({
  host: 'localhost',
  port: 3306,
  user: 'projectg_root',  
  password: 'VpvUhR36YiGT', 
  database: 'projectg_Asztafoglalos3',  
  connectionLimit: 10 
}).promise();

module.exports = pool;
