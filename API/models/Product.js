const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const ProductSchema = Schema(
    {
        farmerID: {
            type: Schema.Types.ObjectId,
            required: true,
        },
        name: {
            type: String,
            required: true,
        },
        price: {
            type: Number,
            required: true,
        },
        image: {
            data: Buffer,
            contentType: String,
            required: true,
        },
        description: {
            type: String,
        },
        date: {
            type: Date,
            default: Date.now(),
        },
    }
);

module.exports = Product = mongoose.model("product", ProductSchema);