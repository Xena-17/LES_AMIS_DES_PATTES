const {Model, DataTypes} = require("sequelize");
const sequelize = require('../Config/Sequelize');
class Reservation extends Model {
}

Reservation.init({
     RE_ID: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true

    },
    RE_Start_Date: {
        type: DataTypes.DATE,
        allowNull: false
    },
    RE_End_Date: {
        type: DataTypes.DATE,
        allowNull: false
    },
    RE_Total_Price: {
        type: DataTypes.DECIMAL,
        allowNull: false
    },
    RE_Status: {
        type: DataTypes.STRING,
        allowNull: false
    },
    PA_ID : {
        type: DataTypes.INTEGER,
        ForeignKey : true,
        references: {
            model: 'PA_ID'
        }
    },
    PS_ID : {
        type: DataTypes.INTEGER,
        ForeignKey : true,
        references: {
            model: 'Pet_Sitters',
            key: 'PS_ID'
        }
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
    modelName: "Reservation",
    tableName: "Reservations",
    timestamps: false
})

module.exports = Reservation;