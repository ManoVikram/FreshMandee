const express = require("express");
const router = express.Router();

const Person = require("../../models/Person");

/*
TYPE    POST
ROUTE   /api/auth/registerPerson
DESC    Route for registering the Person
ACCESS  PUBLIC
 */
router.post("/registerPerson", (request, response) => {
    Person.findOne({ email: request.body.email }).then(
        (person) => {
            if (person) {
                return response.status(400).json({ error: "Email already registered." });
            } else {
                const newPerson = new Person(
                    {
                        firebaseUID: request.body.firebaseUID,
                        email: request.body.email,
                    },
                );

                newPerson.save().then(
                    (person) => response.json(person),
                ).catch(
                    (error) => console.log("Unable to register user: " + error),
                );
            }
        },
    ).catch(
        (error) => console.log("Unable to authenticate user: " + error),
    );
});

/*
TYPE    POST
ROUTE   /api/auth/profile
DESC    Route for viewing Person profile data
ACCESS  PRIVATE
 */
router.post("/profile", (request, response) => {
    Person.findOne({ firebaseUID: request.body.firebaseUID }).then(
        (person) => {
            if (!person) {
                response.status(404).json({ error: "Unable to find user." });
            } else {
                response.json(person);
            }
        }
    ).catch(
        (error) => console.log("Unable to view profile: " + error),
    );
});

module.exports = router;