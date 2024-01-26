const Sequelize = require('sequelize');
const sequelize = require('../database');

class Vehicle extends Sequelize.Model { };

Vehicle.init({
  mark: Sequelize.STRING,
  model: Sequelize.STRING,
  zeroto100: Sequelize.INTEGER,
  topspeed: Sequelize.INTEGER,
  power: Sequelize.INTEGER,
  ecoclass: Sequelize.STRING,
  picture: Sequelize.STRING,
  price: Sequelize.INTEGER,
}, {
  sequelize,
  tableName: "vehicle"
});

// on exporte la class directement !
module.exports = Vehicle;