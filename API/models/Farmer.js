const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const FarmerSchema = Schema(
    {
        firebaseUID: {
            type: String,
            required: true,
        },
        phoneNumber: {
            type: Number,
            required: true,
        },
        name: {
            type: String,
        },
        products: [
            {
                productID: {
                    type: Schema.Types.ObjectId,
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

mongoose.exports = Farmer = mongoose.model("farmer", FarmerSchema);