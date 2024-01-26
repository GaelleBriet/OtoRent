const Agency = require('./agency');
const Vehicle = require('./vehicle');
const Account = require('./account');
const Rent = require('./rent');
// Relations Vehicle - Agency
Vehicle.belongsTo(Agency, {foreignKey: 'agency_id', as : 'location'});
Agency.hasMany(Vehicle, {foreignKey: 'agency_id', as : 'vehicles'});

// Relations User - Rent
Rent.belongsTo(Account, {foreignKey: 'account_id', as : 'client'});
Rent.belongsTo(Vehicle, {foreignKey: 'vehicle_id', as : 'vehicle'});


Account.hasMany(Rent, {foreignKey: 'account_id', as : 'rents'});
Vehicle.hasMany(Rent, {foreignKey: 'vehicle_id', as : 'rents'});


module.exports = {Agency, Vehicle, Account, Rent};