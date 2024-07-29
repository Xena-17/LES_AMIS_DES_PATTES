const {Model, DataTypes} = require("sequelize");
const sequelize = require('../Config/Sequelize');
class Payment extends Model {
}

Payment.init({
     PA_ID: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true

    },
    PA_Date: {
        type: DataTypes.DATE,
        allowNull: false
    },
    PA_Total_Price: {
        type: DataTypes.DECIMAL,
        allowNull: false
    },
    PA_Type: {
        type: DataTypes.STRING,
        allowNull: false
    },
    PA_Status: {
        type: DataTypes.STRING,
        allowNull: false
    }
 
},

{
    sequelize,
    modelName: "Payment",
    tableName: "Payments",
    timestamps: false
})

module.exports = Payment;