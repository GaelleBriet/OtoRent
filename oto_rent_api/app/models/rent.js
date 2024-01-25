const Sequelize = require('sequelize');
const sequelize = require('../database');

class Rent extends Sequelize.Model { };

Rent.init({
    day: Sequelize.DATE,

}, {
    sequelize,
    tableName: "rent"
});

// on exporte la class directement !
module.exports = Rent;