const express = require("express");
const router = express.Router();
const multer = require("multer");
const fs = require("fs");
const path = require("path");

const storage = multer.diskStorage(
    {
        destination: (request, file, cb) => {
            cb(null, "./uploads/category/");
        },
        filename: (request, file, cb) => {
            // cb(null, file.fieldname + "_" + Date.now());
            cb(null, Date.now().toString() + "_" + file.originalname);
        },
    }
);

const fileFilter = (request, file, cb) => {
    if (file.mimetype === "image/jpeg" || file.mimetype === "image/png") {
        cb(null, true);
    } else {
        cb(null, false);
    }
};

const upload = multer({ storage: storage, fileFilter: fileFilter });

const admin = require("../../config/admin");

const Category = require("../../models/Category");
const Person = require("../../models/Person");

/*
TYPE    POST
ROUTE   /api/category/create
DESC    Route for creating new category
ACCESS  PRIVATE
 */
router.post("/create", upload.single("image"), (request, response) => {
    if (request.body.adminFirebaseUID == admin.ADMIN_FIREBASE_UID) {
        Category.findOne({ name: request.body.name.toUpperCase() }).then(
            (category) => {
                if (category) {
                    return response.status(400).json({ error: "Category already exist" });
                } else {
                    const newCategory = new Category(
                        {
                            name: request.body.name.toUpperCase(),
                            /* image: {
                                // data: fs.readFileSync(path.join(__dirname + "/uploads/category/" + request.file.filename)),
                                data: fs.readFileSync(request.files.image.path),
                                contentType: "image/png",
                            }, */
                            // image: request.file.path,
                            image: request.body.image,
                            /* image: {
                                data: fs.readFileSync(request.file.originalname),
                                contentType: "image/png",
                            }, */
                        }
                    );

                    // console.log(newCategory);

                    newCategory.save().then(
                        (category) => response.json(category),
                    ).catch(
                        (error) => console.log("Error while saving category." + error),
                    );
                }
            }
        ).catch(
            (error) => console.log("Error while creating a new category" + error),
        );
    } else {
        return response.status(400).json({ error: "You are not allowed to access this route." });
    }
});

/*
TYPE    POST
ROUTE   /api/category/all
DESC    Route for viewing all categories
ACCESS  PUBLIC
 */
router.post("/all", (request, response) => {
    Person.findOne({ firebaseUID: request.body.firebaseUID }).then(
        (person) => {
            if (!person) {
                response.status(400).json({ error: "You are not allowed to access this route." });
            } else {
                Category.find({}, (error, category) => {
                    if (error) {
                        throw error;
                    } else {
                        var categories = [];

                        category.forEach(categry => {
                            categories.push(categry);
                        });

                        return response.json({ categories: categories });
                    }
                });
            }
        }
    ).catch(
        (error) => console.log("Unauthorized access." + error),
    );
});

/*
TYPE    DELETE
ROUTE   /api/category/delete
DESC    Route for deleting a category
ACCESS  PRIVATE
 */
router.delete("/delete", (request, response) => {
    if (request.body.adminFirebaseUID === admin.ADMIN_FIREBASE_UID) {
        Category.findOneAndDelete(
            {
                name: request.body.name.toUpperCase(),
            },
        ).then(
            (category) => response.json(category),
        ).catch(
            (error) => response.status(400).json({ error: `Unable to find and delete the given category. ${error}` }),
        );
    }
});

module.exports = router;