const express = require("express");
const router = express.Router();

const Person = require("../../models/Person");
const Farmer = require("../../models/Farmer");
const { response } = require("express");

/*
TYPE    POST
ROUTE   /api/auth/farmer/registerFarmer
DESC    Route for registering the Farmer
ACCESS  PRIVATE
 */
router.post("/registerFarmer", (request, response) => {
    if (request.body.adminFirebaseUID == "41Rw5IO23IQoQJTAmvu4Qokr7e43") {
        Person.findOne({ email: request.body.email }).then(
            (person) => {
                if (person) {
                    return response.status(400).json({ error: "Email already exist." });
                } else {
                    const newPerson = new Person(
                        {
                            firebaseUID: request.body.firebaseUID,
                            email: request.body.email,
                            name: request.body.name,
                            phoneNumber: request.body.phoneNumber,
                            isFarmer: true,
                            location: request.body.location,
                        }
                    );

                    /* newPerson.save().then(
                        (person) => response.json(person),
                    ).catch(
                        (error) => console.log("Unable to register farmer: " + error),
                    );

                    Farmer.findOne({ email: request.body.email }).then(
                        (farmer) => {
                            if (farmer) {
                                return response.status(400).json({ error: "Farmer already registered." });
                            } else {
                                const newFarmer = new Farmer(
                                    {
                                        personId: newPerson._id,
                                        firebaseUID: request.body.firebaseUID,
                                    }
                                );

                                newFarmer.save().then(
                                    (farmer) => response.json(farmer),
                                ).catch(
                                    (error) => console.log("Unable to save farmer: " + error),
                                );
                            }
                        }
                    ).catch(
                        (error) => console.log("Error while creating an accoung for farmer." + error),
                    ); */

                    newPerson.save().then(
                        (person) => {
                            Farmer.findOne({ email: request.body.email }).then(
                                (farmer) => {
                                    if (farmer) {
                                        return response.status(400).json({ error: "Farmer already registered." });
                                    } else {
                                        const newFarmer = new Farmer(
                                            {
                                                personID: person._id,
                                                firebaseUID: request.body.firebaseUID,
                                            }
                                        );

                                        console.log(person._id);

                                        newFarmer.save().then(
                                            (farmer) => response.json(
                                                {
                                                    person: person,
                                                    farmer: farmer,
                                                }
                                            ),
                                        ).catch(
                                            (error) => console.log("Unable to save farmer: " + error),
                                        );
                                    }
                                }
                            ).catch(
                                (error) => console.log("Error while creating an accoung for farmer." + error),
                            );
                        },
                    ).catch(
                        (error) => console.log("Unable to register farmer: " + error),
                    );
                }
            }
        ).catch(
            (error) => console.log("Unable to authenticate farmer: " + error),
        );
    } else {
        response.status(400).json({ error: "You are not allowed to access this route." });
    }
});

/*
TYPE    POST
ROUTE   /api/auth/farmer/all
DESC    Route for view all farmers
ACCESS  PRIVATE
 */

router.post("/all", (request, response) => {
    if (request.body.adminFirebaseUID == "41Rw5IO23IQoQJTAmvu4Qokr7e43") {
        Person.find({}, (error, farmer) => {
            if (error) {
                throw error;
            } else {
                var farmers = [];

                farmer.forEach(farmr => {
                    if (farmr.isFarmer) {
                        farmers.push(farmr);
                    }
                });

                response.json({farmers: farmers});
            }
        });
    } else {
        response.status(400).json({ error: "You are not allowed to access this route." });
    }
});

module.exports = router;