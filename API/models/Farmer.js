const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const FarmerSchema = Schema(
    {
        personID: {
            type: Schema.Types.ObjectId,
            required: true,
        },
        firebaseUID: {
            type: String,
            required: true,
        }
    },
);

mongoose.exports = Farmer = mongoose.model("farmer", FarmerSchema);