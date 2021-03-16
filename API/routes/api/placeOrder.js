const express = require("express");
const router = express.Router();

const Person = require("../../models/Person");
const Cart = require("../../models/Cart");
const Product = require("../../models/Product");
const { response } = require("express");
const { route } = require("./userCart");

/*
TYPE    POST
ROUTE   /api/user/placeOrder
DESC    Route for placing a new order for the user.
ACCESS  PUBLIC
 */
router.post("/placeOrder", (request, response) => {
    Person.findOne({ firebaseUID: request.body.firebaseUID }).then(
        (person) => {
            if (!person) {
                return response.status(400).json({ error: "You are not allowed to access this route." });
            } else {
                Cart.findOne({ _id: person.cartID }).then(
                    (cart) => {
                        if (!cart) {
                            return response.status(400).json({ error: "Your cart is empty." });
                        } else {
                            // var cartItems = [];

                            // for (let index = 0; index < cart.productsList.length; index++) {
                            //     const cartProduct = cart.productsList[index];

                            //     console.log(cartProduct);
                                
                            //     Product.findOne({ _id: cartProduct.productID }).then(
                            //         (productData) => {
                            //             if (productData) {
                            //                 var boughtProductValues = {};
                            //                 boughtProductValues.productID = cartProduct.productID;
                            //                 boughtProductValues.quantity = cartProduct.quantity;
                            //                 boughtProductValues.price = productData.price;

                            //                 cartItems.push(boughtProductValues);

                            //                 console.log(cartItems);
                            //                 console.log(cartItems.length);

                            //                 /* console.log(boughtProductValues);
    
                            //                 person.productsBuy.push(boughtProductValues);
    
                            //                 // console.log(person.productData);
    
                            //                 // console.log("INSIDE");
    
                            //                 person.save().then().catch(
                            //                     (error) => console.log("Unable to place your order at the moment. " + error),
                            //                 );
    
                            //                 Person.findOneAndUpdate(
                            //                     {
                            //                         firebaseUID: request.body.firebaseUID,
                            //                     },
                            //                     {
                            //                         $addToSet: {
                            //                             productsBuy: boughtProductValues,
                            //                         },
                            //                     },
                            //                     {
                            //                         safe: true,
                            //                         multi: true,
                            //                         new: true,
                            //                     }
                            //                 ).then(
                            //                     (person) => response.json(person),
                            //                 ).catch(
                            //                     (error) => console.log("Error while placing your order. Try again later. " + error),
                            //                 ); */
                            //             } else {
                            //                 return response.status(400).json({ error: "Product unavailable." });
                            //             }
                            //         },
                            //     ).catch(
                            //         (error) => console.log("Error while fetching the correct price of the product. " + error),
                            //     );
                            // }

                            // console.log("BOOMmm....");
                            // console.log(cartItems);

                            Person.findOneAndUpdate(
                                {
                                    firebaseUID: request.body.firebaseUID,
                                },
                                {
                                    /* $push: {
                                        productsBuy: {
                                            $each: cartItems,
                                        }
                                    } */
                                    $push: {
                                        productsBuy: cart.productsList,
                                    }
                                },
                                {
                                    new: true,
                                    safe: true,
                                    multi: true,
                                }
                            ).then(
                                (updatedPerson) => {
                                    // response.json(updatedPerson)
                                    
                                    Cart.findOneAndUpdate(
                                        {
                                            _id:person.cartID,
                                        },
                                        {
                                            $set: {
                                                productsList: [],
                                            },
                                        },
                                        {
                                            new: true,
                                            multi: true,
                                        }
                                    ).then(
                                        (updatedCart) => response.json({ person: updatedPerson, cart: updatedCart }),
                                    ).catch(
                                        (error) => console.log("Uhhh... Error while completing the order. " + error),
                                    );
                                },
                            ).catch(
                                (error) => console.log("Cannot place order at the moment. " + error),
                            );
                        }
                    }
                ).catch(
                    (error) => console.log("Error while placing the order. " + error),
                );
            }
        }
    ).catch(
        (error) => console.log("Unable to place the order. " + error),
    );
});

module.exports = router;