const Sequelize = require('sequelize');
const path = require('path');
const config = require(path.join(__dirname, 'config.json'));


// Crée la connexion a notre base de données 
// Équivalent à PDO en PHP
const sequelize = new Sequelize(config.database, config.username, config.password, {
    host : config.host,
    dialect : "mysql",
    port : config.port
})

module.exports = sequelize;