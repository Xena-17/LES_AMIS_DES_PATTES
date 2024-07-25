const {Model, Datatypes} = require("sequelize");
const Sequelize = require('./Config/sequelize.js');
class User extends Model {
}

User.init({
      US_ID: {
        type: DataTypes.VARCHAR(10),
        primaryKey: true,
        autoIncrement: true

    },
    US_Name: {
        type: DataTypes.VARCHAR(255),
        allowNull: false
    },
    US_First_Name: {
        type: DataTypes.VARCHAR(255),
        allowNull: false
    },
    US_Address: {
        type: DataTypes.VARCHAR(255),
        allowNull: false
    },
    US_Postcode: {
        type: DataTypes.VARCHAR(5),
        allowNull: false
    },
    US_City: {
        type: DataTypes.VARCHAR(255),
        allowNull: false,
    },
    US_Phone : {
        type: DataTypes.CHAR,
        allowNull: false,
        length: 13,
        unique: true,
    },
    US_Email: {
        type: DataTypes.VARCHAR(255),
        allowNull: false,
        unique: true
    },
    US_Role: {
        type: DataTypes.VARCHAR(50),
        unique: false,
        allowNull: true,
    }
   
}),
{
    sequelize,
    modelName: "User",
    tableName: "Users",
    timestamps: false
}

module.exports = User;