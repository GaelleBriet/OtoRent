const Sequelize = require('sequelize');
const sequelize = require('../database');

class Agency extends Sequelize.Model { };

Agency.init({
  name: Sequelize.STRING,
  address: Sequelize.STRING,
  latitude: Sequelize.FLOAT,
  longitude: Sequelize.FLOAT,
  phone: Sequelize.STRING,
  email: Sequelize.STRING,
}, {
  sequelize,
  tableName: "agency"
});

// on exporte la class directement !
module.exports = Agency;