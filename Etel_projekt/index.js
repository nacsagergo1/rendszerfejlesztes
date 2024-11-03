const express = require("express");
const session = require('express-session');
const bodyParser = require('body-parser');
const path = require("path");
const { Pool } = require("pg");
const genRoutes = require('./routes/gen_routes');
const userRoutes = require('./routes/user_routes');

const app = express();
const PORT = process.env.port || 8080;
const cookieParser = require("cookie-parser");
app.use(session({
  secret: 'cxyb5OVktj6baDGKpsZzRvpcStrDTsR9',
  resave: false,
  saveUninitialized: true,
  cookie: { secure: false },
}));
app.use(cookieParser());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.set("view engine", "ejs");
app.use('/', genRoutes);
app.set("views", path.join(__dirname, "views"));
app.use(express.static(path.join(__dirname, "public")));
app.use(express.urlencoded({ extended: false }));
app.use(userRoutes);


app.listen(PORT, () => {
    console.log("App listening at: http://localhost:8080/");
  });

