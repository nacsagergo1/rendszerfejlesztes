const express = require("express");
const session = require('express-session');
const bodyParser = require('body-parser');
const cookieParser = require("cookie-parser");
const path = require("path");


const genRoutes = require('./routes/gen_routes');
const userRoutes = require('./routes/user_routes');
const reservationRoutes = require('./routes/reservation_routes');
const authRoutes = require('./routes/auth_routes');
const foodRoutes = require('./routes/food_routes');


const app = express();
const PORT = process.env.PORT || 8080;

// Session és cookie konfigurációk
app.use(session({
  secret: 'cxyb5OVktj6baDGKpsZzRvpcStrDTsR9',
  resave: false,
  saveUninitialized: true,
  cookie: {
    secure: false,  // Ha nem HTTPS-en futsz, akkor állítsd false-ra
    maxAge: 1000 * 60 * 60,
  },
}));

app.use((req, res, next) => {
  res.locals.user = req.session.user;
  next();
});
app.use(cookieParser());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));
app.use(express.static(path.join(__dirname, "public")));
app.use(express.urlencoded({ extended: false }));



app.use(reservationRoutes);  
app.use(userRoutes);  
app.use('/', genRoutes);
app.use(authRoutes);
app.use(foodRoutes);

app.listen(PORT, () => {
    console.log(`App listening at: http://localhost:${PORT}/`);
});