const mysql = require("mysql2");

const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  // password: "NO",
  database: "e-commerce",
});

module.exports = connection;
