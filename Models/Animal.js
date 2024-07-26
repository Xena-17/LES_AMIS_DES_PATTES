const {Model, DataTypes} = require("sequelize");
const sequelize = require('../Config/Sequelize');
class Animal extends Model {
}

Animal.init({
     AN_ID: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true

    },
    AN_Name: {
        type: DataTypes.STRING,
        allowNull: false
    },
    AN_Specie: {
        type: DataTypes.STRING,
        allowNull: false
    },
    AN_Breed: {
        type: DataTypes.STRING,
        allowNull: false
    },
    AN_Age: {
        type: DataTypes.DECIMAL,
        allowNull: false
    },
    AN_Medical_History: {
        type: DataTypes.BOOLEAN,
        allowNull: false,
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
    modelName: "Animal",
    tableName: "Animals",
    timestamps: false
})

module.exports = Animal;