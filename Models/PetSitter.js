const {Model, DataTypes} = require("sequelize");
const sequelize = require('../Config/Sequelize');
class PetSitter extends Model {
}

PetSitter.init({
     PS_ID: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true

    },
    PS_Description: {
        type: DataTypes.STRING,
        allowNull: false
    },
    PS_Experience: {
        type: DataTypes.STRING,
        allowNull: false
    },
    PS_Hourly_Rate: {
        type: DataTypes.DECIMAL,
        allowNull: false
    },
    PS_Availability: {
        type: DataTypes.DATE,
        allowNull: false
    },
    US_ID : {
        type: DataTypes.INTEGER,
        ForeignKey : true,
        references: {
            model: 'Users',
            key: 'US_ID'
        }
    },
   
},
{
    sequelize,
    modelName: "PetSittter",
    tableName: "Pet_Sitters",
    timestamps: false
})

module.exports = PetSitter;