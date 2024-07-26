const {Model, DataTypes} = require("sequelize");
const sequelize = require('../Config/Sequelize');
class User extends Model {
}

User.init({
     US_ID: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true

    },
    US_Name: {
        type: DataTypes.STRING,
        allowNull: false
    },
    US_First_Name: {
        type: DataTypes.STRING,
        allowNull: false
    },
    US_Address: {
        type: DataTypes.STRING,
        allowNull: false
    },
    US_Postcode: {
        type: DataTypes.STRING,
        allowNull: false
    },
    US_City: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    US_Phone : {
        type: DataTypes.CHAR,
        allowNull: false,
        length: 13,
        unique: true,
    },
    US_Email: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true
    },
    US_Role: {
        type: DataTypes.STRING,
        unique: false,
        allowNull: true,
    }
   
},
{
    sequelize,
    modelName: "User",
    tableName: "Users",
    timestamps: false
})

module.exports = User;