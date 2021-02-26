const express = require("express");
const router = express.Router();

const Farmer = require("../../models/Farmer");

/*
TYPE    POST
ROUTE   /api/auth/registerFarmer
DESC    Route for registering farmers
ACCESS  PUBLIC
 */
router.post("/registerFarmer", (request, response) => {});

module.exports = router;