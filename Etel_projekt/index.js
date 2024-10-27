const express = require("express");
const path = require("path");

const app = express();
const PORT = process.env.port || 8080;
app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));
app.use(express.static(path.join(__dirname, "public")));
app.use(express.urlencoded({ extended: false }));

app.get('/', (req, res)=>{
    res.status(200);
    res.send("Welcome to root URL of Server");
});

app.listen(PORT, () => {
    console.log("App listening at: http://localhost:8080/");
  });

