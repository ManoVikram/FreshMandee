const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const PersonSchema = Schema(
    {
        firebaseUID: {
            type: String,
            required: true,
        },
        email: {
            type: String,
            required: true,
        },
        phoneNumber: {
            type: Number,
        },
        name: {
            type: String,
        },
        isFarmer: {
            type: Boolean,
            default: false,
        },
        location: {
            type: String,
        },
        productsSell: [
            {
                productID: {
                    type: Schema.Types.ObjectId,
                },
                quantity: {
                    type: Number,
                    default: 0,
                },
                date: {
                    type: Date,
                    default: Date.now(),
                },
            }
        ],
        productsBuy: [
            {
                productID: {
                    type: Schema.Types.ObjectId,
                },
                quantity: {
                    type: Number,
                    default: 0,
                },
                date: {
                    type: Date,
                    default: Date.now(),
                },
            }
        ],
        date: {
            type: Date,
            default: Date.now(),
        },
    }
);

mongoose.exports = Person = mongoose.model("person", PersonSchema);