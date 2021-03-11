const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const CartSchema = Schema(
    {
        productsList: [
            {
                productID: {
                    type: Schema.Types.ObjectId,
                },
                quantity: {
                    type: Number,
                    default: 0,
                },
            },
        ],
    }
);