const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const CartSchema = Schema(
    {
        userID: {
            type: Schema.Types.ObjectId,
            required: true,
        },
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

module.exports = Cart = mongoose.model("cart", CartSchema);