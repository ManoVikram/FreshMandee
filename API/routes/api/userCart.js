const { response } = require("express");
const express = require("express");
const router = express.Router();

const Person = require("../../models/Person");
const Cart = require("../../models/Cart");

/*
TYPE    POST
ROUTE   /api/user/cart/new
DESC    Route for creating a new cart for the user.
ACCESS  PUBLIC
 */
router.post("/new", (request, response) => {
    Person.findOne({ firebaseUID: request.body.firebaseUID }).then(
        (person) => {
            if (!person) {
                return response.status(400).json({ error: "You are not allowed to access this route." });
            } else {
                Cart.findOne({ userID: person._id }).then(
                    (cart) => {
                        if (cart) {
                            return response.status(400).json({ error: "A cart has already been assigned to this user." });
                        } else {
                            const newCart = new Cart(
                                {
                                    userID: person._id,
                                }
                            );

                            newCart.save().then(
                                (cart) => {
                                    person.cartID = cart._id;
                                    return response.json(cart);
                                }
                            ).catch(
                                (error) => console.log("Error while creating a cart for the user. " + error),
                            );
                        }
                    }
                ).catch(
                    (error) => console.log("Unable to find a cart for the user. " + error),
                );
            }
        }
    ).catch(
        (error) => console.log("Unable to find the right user."),
    );
});

/*
TYPE    POST
ROUTE   /api/user/cart/add
DESC    Route for adding products to user cart
ACCESS  PUBLIC
 */
router.post("/add", (request, response) => {
    Person.findOne({ firebaseUID: request.body.firebaseUID }).then(
        (person) => {
            if (!person) {
                return response.status(500).json({ error: "You are not allowed to access this route." });
            } else {
                Cart.findOne({ userID: person._id }).then(
                    (cart) => {
                        if (!cart) {
                            const newCart = new Cart(
                                {
                                    userID: person._id,
                                }
                            );

                            newCart.save().then(
                                (cart) => {
                                    person.cartID = cart._id;

                                    person.save().then(
                                        (person) => {
                                            cart.productsList.push(
                                                {
                                                    productID: request.body.productID,
                                                    quantity: request.body.quantity,
                                                }
                                            );

                                            cart.save().then(
                                                (cart) => response.json({ person: person, cart: cart }),
                                            ).catch(
                                                (error) => console.log("Error while adding a new product to cart. " + error),
                                            );
                                        },
                                    ).catch(
                                        (error) => console.log("Error while saving the cart." + error),
                                    );
                                    // return response.json(cart);
                                }
                            ).catch(
                                (error) => console.log("Error while creating a cart for the user. " + error),
                            );
                        } else {
                            Cart.findOne({ "productsList.productID": request.body.productID }).then(
                                (cart) => {
                                    if (cart) {
                                        Cart.findOneAndUpdate(
                                            {
                                                "productsList.productID": request.body.productID,
                                            },
                                            {
                                                $set: {
                                                    "productsList.$.quantity": request.body.quantity,
                                                },
                                            },
                                            {
                                                new: true,
                                            },
                                        ).then(
                                            (cart) => response.json({person: person, cart: cart}),
                                        ).catch(
                                            (error) => console.log("Unable to update the cart. " + error),
                                        );
                                    } else {
                                        Cart.findOne({ userID: person._id }).then(
                                            (cart) => {
                                                if (cart) {
                                                    cart.productsList.push(
                                                        {
                                                            productID: request.body.productID,
                                                            quantity: request.body.quantity,
                                                        }
                                                    );

                                                    cart.save().then(
                                                        (cart) => response.json({person: person, cart: cart}),
                                                    ).catch(
                                                        (error) => console.log("Error while updating the product in your cart. " + error),
                                                    );
                                                }
                                            }
                                        ).catch(
                                            (error) => console.log("Error while adding item to the cart. " + error),
                                        );
                                    }
                                }
                            ).catch(
                                (error) => console.log("Unable to add/update the product in the cart. " + error),
                            );
                        }
                    }
                ).catch(
                    (error) => console.log("Error while fetching cart details. " + error),
                );
            }
        }
    ).catch(
        (error) => console.log("Error while finding the right user. " + error),
    );
});

/*
TYPE    POST
ROUTE   /api/user/cart/removeProduct
DESC    Route for removing products from the user cart
ACCESS  PUBLIC
 */
router.delete("/removeProduct", (request, response) => {
    Person.findOne({ firebaseUID: request.body.firebaseUID }).then(
        (person) => {
            if (!person) {
                return response.status(400).json({ error: "You are not allowed to access this route." });
            } else {
                Cart.findOne({ userID: person._id }).then(
                    (cart) => {
                        if (!cart) {
                            return response.status(400).json({ error: "No items in your cart." });
                        } else {
                            Cart.updateOne(
                                {
                                    userID: person._id,
                                },
                                {
                                    $pull: {
                                        productsList: {
                                            productID: request.body.productID,
                                        }
                                    },
                                },
                                {
                                    safe: true,
                                    multi: true,
                                },
                            ).then(
                                (action) => response.json(action),
                            ).catch(
                                (error) => console.log("Error while removing the product from the cart. " + error),
                            );
                        }
                    }
                ).catch(
                    (error) => console.log("Error while finding the right cart of the user. " + error),
                );
            }
        }
    ).catch(
        (error) => console.log("Unable to remove product from the cart. " + error),
    );
});

module.exports = router;