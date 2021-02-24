const express = require("express");
const mongoose = require("mongoose");
const bodyParser = require("body-parser");

const app = express();

const HOST = "192.168.43.50";
const PORT = process.env.PORT || 3000;

// Middleware for body-parser
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());


app.listen(PORT, HOST, () => console.log(`Server is running on http://${HOST}:${PORT}`));
