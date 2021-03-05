const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const CategorySchema = Schema(
    {
        name: {
            type: String,
            required: true,
        },
        image: {
            data: Buffer,
            contentType: String,
            required: true,
        },
    }
);

module.exports = Category = mongoose.model("category", CategorySchema);