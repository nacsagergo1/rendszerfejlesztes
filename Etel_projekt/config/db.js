const mysql = require('mysql');

module.exports = mysql.createConnection({
    host: 'localhost',
    port: 3306,
    database: 'projectg_Asztafoglalos'
});
