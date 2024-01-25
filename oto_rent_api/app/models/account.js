const Sequelize = require('sequelize');
const sequelize = require('../database');

class Account extends Sequelize.Model { };

Account.init({
    name: Sequelize.STRING,
    firstname: Sequelize.STRING,
    password: Sequelize.STRING,
    email: Sequelize.STRING,
    role: Sequelize.STRING,
}, {
    sequelize,
    tableName: "account"
});

// on exporte la class directement !
module.exports = Account;