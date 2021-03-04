const express = require("express");
const mongoose = require("mongoose");
const bodyParser = require("body-parser");

const app = express();

const HOST = "192.168.43.50";
const PORT = process.env.PORT || 3000;

// Middleware for body-parser
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// Importing all routes
const authenticateUser = require("./routes/api/registerPerson");
const authenticateFarmer = require("./routes/api/registerFarmer");

// MongoDB configuration
const db = require("./config/urls").mongoURL;

// Attempt to connect to database
mongoose.connect(db, { useNewUrlParser: true, useUnifiedTopology: true, useFindAndModify: false }).then(
        () => console.log("Connected to MongoDB successfully."),
).catch(
    (error) => console.log("Error connecting to MongoDB." + error),
);

// Routes
app.use("/api/auth", authenticateUser);
app.use("/api/auth/farmer", authenticateFarmer);

app.listen(PORT, HOST, () => console.log(`Server is running on http://${HOST}:${PORT}`));
