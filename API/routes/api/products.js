const { response } = require("express");
const express = require("express");
const mongoose = require("mongoose");
const router = express.Router();
const multer = require("multer");

const storage = multer.diskStorage(
    {
        destination: (request, file, cb) => {
            cb(null, "./uploads/product/");
        },
        filename: (request, file, cb) => {
            cb(null, Date.now().toString() + "_" + file.originalname);
        },
    }
);

const fileFilter = (request, file, cb) => {
    if (file.mimetype === "image/jpeg" || file.mimetype == "image/png") {
        cb(null, true);
    } else {
        cb(null, false);
    }
};

const upload = multer({ storage: storage, fileFilter: fileFilter });

const admin = require("../../config/admin");

const Category = require("../../models/Category");
const Person = require("../../models/Person");
const Product = require("../../models/Product");

/*
TYPE    POST
ROUTE   /api/category/product/create
DESC    Route for creating new product under a category
ACCESS  PRIVATE
 */
router.post("/create", upload.single("image"), (request, response) => {
    if (request.body.adminFirebaseUID == admin.ADMIN_FIREBASE_UID){
        Category.findOne({ _id: request.body.categoryID }).then(
            (category) => {
                if (!category) {
                    return response.status(400).json({ error: "The category is not available." });
                } else {
                    Product.findOne({ name: request.body.name }).then(
                        (product) => {
                            if (product) {
                                return response.status(400).json({ error: "The product is already present." });
                            } else {
                                const newProduct = new Product(
                                    {
                                        categoryID: category._id,
                                        name: request.body.name.toUpperCase(),
                                        price: request.body.price,
                                        image: request.body.image,
                                        description: request.body.description,
                                    },
                                );

                                newProduct.save().then(
                                    (product) => response.json(product),
                                ).catch(
                                    (error) => console.log("Unable to save the product under the category. " + error),
                                );
                            }
                        }
                    ).catch(
                        (error) => console.log("Error while finding the respective product" + error),
                    );
                }
            }
        ).catch(
            (error) => console.log("Error while finding the respective category. " + error),
        );
    }
});

/*
TYPE    POST
ROUTE   /api/category/product/all
DESC    Route for all the products under a category
ACCESS  PUBLIC
 */
router.post("/all", (request, response) => {
    Person.findOne({ firebaseUID: request.body.firebaseUID }).then(
        (person) => {
            if (!person) {
                return response.status(400).json({ error: "You are not allowed to access this route." });
            } else {
                Category.findOne({ _id: request.body.categoryID }).then(
                    (category) => {
                        if (!category) {
                            return response.status(400).json({ error: "Category unavailable." });
                        } else {
                            Product.find({}, (error, product) => {
                                if (error) {
                                    throw error;
                                } else {
                                    var products = [];

                                    /* product.forEach(prodct => {
                                        console.log(prodct.categoryID + " " + category._id);
                                        if (prodct.categoryID === request.body.categoryID) {
                                            products.push(prodct);
                                        }
                                    }); */

                                    for (var i = 0; i < product.length; i++) {
                                        console.log(product[i].categoryID + " " + category._id);
                                        if (product[i].categoryID == request.body.categoryID) {
                                            products.push(product[i]);
                                        }
                                    }

                                    return response.json({ products: products });
                                }
                            });
                        }
                    }
                ).catch(
                    (error) => console.log("Unable to find the category of the product." + error),
                );
            }
        }
    ).catch(
        (error) => console.log("Cannot allow the user to access this route. " + error),
    );
});

/*
TYPE    POST
ROUTE   /api/category/product/allProducts
DESC    Route for all the products
ACCESS  PRIVATE
 */
router.post("/allProducts", (request, response) => {
    if (request.body.adminFirebaseUID == admin.ADMIN_FIREBASE_UID) {
        Person.findOne({ firebaseUID: request.body.adminFirebaseUID }).then(
            (person) => {
                if (!person) {
                    return response.status(400).json({ error: "You are not allowed to access this route." });
                } else {
                    Product.find({}, (error, product) => {
                        if (error) {
                            throw error;
                        } else {
                            var products = [];

                            product.forEach(prodct => {
                                products.push(prodct);
                            });

                            return response.json({ allProducts: products });
                        }
                    });
                }
            }
        ).catch(
            (error) => console.log("Cannot allow the user to access this route. " + error),
        );
    }
});

/*
TYPE    POST
ROUTE   /api/category/product/view
DESC    Route to view details of a particular product under a category
ACCESS  PUBLIC
 */
router.post("/view", (request, response) => {
    Person.findOne({ firebaseUID: request.body.firebaseUID }).then(
        (person) => {
            if (!person) {
                return response.status(400).json({ error: "You are not allowed to access this route." });
            } else {
                Category.findOne({ _id: request.body.categoryID }).then(
                    (category) => {
                        if (!category) {
                            return response.status(400).json({ error: "No such category available." });
                        } else {
                            Product.findOne({ _id: request.body.productID }).then(
                                (product) => {
                                    if (!product) {
                                        return response.status(400).json({ error: "Product unavailable" });
                                    } else {
                                        return response.json(product);
                                    }
                                }
                            ).catch(
                                (error) => console.log("Unable to find the right product. " + error),
                            );
                        }
                    }
                ).catch(
                    (error) => console.log("Unable to find the correct category. " + error),
                );
            }
        }
    ).catch(
        (error) => console.log("Unable to find the user. " + error),
    );
});

/*
TYPE    POST
ROUTE   /api/category/product/update
DESC    Route for the product under a certain category
ACCESS  PUBLIC
 */
router.post("/update", (request, response) => {
    // if (request.body.adminFirebaseUID == admin.ADMIN_FIREBASE_UID) {
        Person.findOne({ firebaseUID: request.body.firebaseUID }).then(
            (person) => {
                if (!person || !person.isFarmer) {
                    return response.status(400).json({ error: "You are not allowed to access this route." });
                } else {
                    Category.findOne({ _id: request.body.categoryID }).then(
                        (category) => {
                            if (!category) {
                                return response.status(400).json({ error: "Category not found." });
                            } else {
                                Product.findOne({ _id: request.body.productID }).then(
                                    (product) => {
                                        if (!product) {
                                            return response.status(400).json({ error: "The product isn't available. You can create a new one." });
                                        } else {
                                            var productValues = {};
                                            productValues._id = product._id;

                                            if (request.body.price) productValues.price = request.body.price;
                                            if (request.body.image) productValues.image = request.body.image;
                                            if (request.body.description) productValues.description = request.body.description;

                                            mongoose.set("useFindAndModify", false);
                                            Product.findOneAndUpdate(
                                                {
                                                    _id: product._id,
                                                },
                                                {
                                                    $set: productValues,
                                                },
                                                {
                                                    new: true,
                                                },
                                            ).then(
                                                (product) => response.json(product),
                                            ).catch(
                                                (error) => console.log("Error while updating the product. " + error),
                                            );
                                        }
                                    }
                                ).catch(
                                    (error) => console.log("Error while find the right product to update. " + error),
                                );
                            }
                        }
                    ).catch(
                        (error) => console.log("Error while finding the category of the product. " + error),
                    );
                }
            }
        ).catch(
            (error) => console.log("Unable to allow user to access this route. " + error),
        );
    /* } else {
        return response.status(400).json({ error: "You are not allowed to access this route." });
    } */
});

module.exports = router;