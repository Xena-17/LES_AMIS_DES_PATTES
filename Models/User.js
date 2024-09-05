const {Model, DataTypes} = require("sequelize");
const sequelize = require('../Config/Sequelize');
const bcrypt = require ('bcrypt');

class User extends Model {
        async validatePassword(password){
            return await bcrypt.compare(password, this.US_Password);
        }
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
        unique: true,
    },
    US_Password: {
        type: DataTypes.TEXT,
        allowNull: false,
  
    },
    US_Role: {
        type: DataTypes.STRING,
        unique: false,
        allowNull: true,
    }
   
},{
    sequelize,
    modelName: "User",
    tableName: "Users",
    timestamps: false,
    hooks :{
        // Hook qui s'exécute avant la création d'un nouvel utilisateur
        beforeCreate: async (user) => {
             // Hash le mot de passe avec bcrypt avant de l'enregistrer dans la base de données
            user.US_Password = await bcrypt.hash(user.US_Password,10)
        },
        // Hook qui s'exécute avant la mise à jour d'un utilisateur
        beforeUpdate : async (user) => {
            // Si le mot de passe a été modifié, il est hashé avec bcrypt avant de l'enregistrer 
            // dans la base de données  (sinon rien ne change)
            console.log(user.US_Password);
            if (user.changed('US_Password')) {
                user.US_Password = await bcrypt.hash(user.US_Password,10);
            }
        }
    }
})

module.exports = User;