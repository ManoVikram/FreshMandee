const express = require("express");
const router = express.Router();
const mongoose = require("mongoose");

const admin = require("../../config/admin");

const Person = require("../../models/Person");
const Farmer = require("../../models/Farmer");

/*
TYPE    POST
ROUTE   /api/auth/update/user
DESC    Route to update user data
ACCESS  PUBLIC
 */
router.post("/user", (request, response) => {
    Person.findOne({ firebaseUID: request.body.firebaseUID }).then(
        (person) => {
            if (!person) {
                return response.status(404).json({ error: "Unable to find user" });
            } 
            
            var userProfileValues = {};
            userProfileValues.firebaseUID = request.body.firebaseUID;

            if (request.body.name) userProfileValues.name = request.body.name;
            if (request.body.phoneNumber) userProfileValues.phoneNumber = request.body.phoneNumber;
            if (request.body.location) userProfileValues.location = request.body.location;
            
            mongoose.set("useFindAndModify", false);

            console.log(userProfileValues);

            Person.findOneAndUpdate(
                {
                    firebaseUID: request.body.firebaseUID,
                },
                {
                    $set: userProfileValues,
                },
                {
                    new: true,
                }
            ).then(
                (person) => response.json(person),
            ).catch(
                (error) => response.status(400).json({ error: `Error while updating user profile: ${error}` }),
            );
        }
    ).catch(
        (error) => console.log("Unable to update user data: " + error),
    );
});

/*
TYPE    POST
ROUTE   /api/auth/update/userToFarmer
DESC    Route to update user to farmer
ACCESS  PRIVATE
 */
router.post("/userToFarmer", (request, response) => {
    if (request.body.adminFirebaseUID == admin.ADMIN_FIREBASE_UID) {
        Person.findOne({ firebaseUID: request.body.firebaseUID }).then(
            (person) => {
                if (!person) {
                    return response.status(400).json({ error: "User not found." });
                }

                mongoose.set("useFindAndModify", false);

                Person.findOneAndUpdate(
                    {
                        firebaseUID: request.body.firebaseUID,
                    },
                    {
                        $set: { isFarmer: true },
                    },
                    {
                        new: true,
                    }
                ).then(
                    (person) => {
                        Farmer.findOne({ firebaseUID: request.body.firebaseUID }).then(
                            (farmer) => {
                                if (farmer) {
                                    return response.status(400).json({ error: "Already a farmer." });
                                }

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
                                    (error) => console.log("Unable to save while converting user to farmer: " + error),
                                );
                            }
                        ).catch(
                            (error) => console.log("ERROR: Unable to update user to farmer properly" + error),
                        );
                    },
                ).catch(
                    (error) => response.status(400).json({ error: `Error while updating user to farmer ${error}` }),
                );
            }
        ).catch(
            (error) => console.log("Unable to update user to farmer" + error),
        );
    } else {
        return response.status(400).json({ error: "You are not allowed to access this route." });
    }
});

/*
TYPE    POST and DELETE
ROUTE   /api/auth/update/farmerToUser
DESC    Route to update farmer to user
ACCESS  PRIVATE
 */
router.post("/farmerToUser", (request, response) => {
    if (request.body.adminFirebaseUID == admin.ADMIN_FIREBASE_UID) {
        Person.findOne({ firebaseUID: request.body.firebaseUID }).then(
            (person) => {
                if (!person) {
                    return response.status(400).json({ error: "User not found." });
                }

                mongoose.set("useFindAndModify", false);

                Person.findOneAndUpdate(
                    {
                        firebaseUID: request.body.firebaseUID,
                    },
                    {
                        $set: { isFarmer: false },
                    },
                    {
                        new: true,
                    }
                ).then(
                    (person) => {
                        Farmer.findOneAndDelete(
                            {
                                personID: person._id,
                            }
                        ).then(
                            (farmer) => response.json(
                                {
                                    person: person,
                                    farmer: farmer,
                                }
                            ),
                        ).catch(
                            (error) => response.status(400).json({ error: `Unable to convert farmer to user properly. ${error}` }),
                        );
                    },
                ).catch(
                    (error) => response.status(400).json({ error: `Error while updating farmer to user ${error}` }),
                );
            }
        ).catch(
            (error) => console.log("Unable to update farmer to user" + error),
        );
    } else {
        return response.status(400).json({ error: "You are not allowed to access this route." });
    }
});

module.exports = router;