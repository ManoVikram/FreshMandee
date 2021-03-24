const express = require("express");
const mongoose = require("mongoose");
const bodyParser = require("body-parser");

const app = express();

const HOST = "192.168.42.227";
const PORT = process.env.PORT || 3000;

// Middleware for body-parser
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// app.use(express.urlencoded({ extended: false }));
// app.use(express.json());

// Importing all routes
const authenticateUser = require("./routes/api/registerPerson");
const authenticateFarmer = require("./routes/api/registerFarmer");
const updateUser = require("./routes/api/updatePerson");
const categories = require("./routes/api/categories");
const products = require("./routes/api/products");
const cart = require("./routes/api/userCart");
const placeOrder = require("./routes/api/placeOrder");

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
app.use("/api/auth/update", updateUser);
app.use("/api/category", categories);
app.use("/api/category/product", products);
app.use("/api/user/cart", cart);
app.use("/api/user", placeOrder);

app.listen(PORT, HOST, () => console.log(`Server is running on http://${HOST}:${PORT}`));
