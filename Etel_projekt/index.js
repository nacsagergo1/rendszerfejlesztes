const express = require("express");
const path = require("path");
const { Pool } = require("pg");
const genRoutes = require('./routes/gen_routes');

const app = express();
const PORT = process.env.port || 8080;
const cookieParser = require("cookie-parser");
app.use(cookieParser());
app.set("view engine", "ejs");
app.use('/', genRoutes);
app.set("views", path.join(__dirname, "views"));
app.use(express.static(path.join(__dirname, "public")));
app.use(express.urlencoded({ extended: false }));

app.listen(PORT, () => {
    console.log("App listening at: http://localhost:8080/");
  });

