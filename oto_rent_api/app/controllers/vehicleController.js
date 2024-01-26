const { Vehicle } = require('../models');
const logger = require('../helpers/logger');
const vehicleController = {
    getVehicles: async (req, res) => {
        try{
            const vehicles = await Vehicle.findAll({
                include: ['location']
            });
            res.json(vehicles);
        }catch(err){
            logger.error(`Error while getting vehicles : ${err.stack}`);
            res.status(500).send('Error while getting vehicles');
        }
    },

    getVehicle: async (req, res) => {
        try{
            const vehicle = await Vehicle.findOne({
                where: { id: req.params.id },
                include: ['location']
            });
            res.json(vehicle);
        }catch(err){
            logger.error(`Error while getting vehicle : ${err.stack}`);
            res.status(500).send('Error while getting vehicle');
        }
    },

    createVehicle: async (req, res) => {
        try{
            const vehicle = await Vehicle.create(req.body);
            res.json(vehicle);
        }catch(err){
            logger.error(`Error while creating vehicle : ${err.stack}`);
            res.status(500).send('Error while creating vehicle');
        }
    },

    updateVehicle: async (req, res) => {
        try{
            const vehicle = await Vehicle.update(req.body, {
                where: { id: req.params.id }
            });
            res.json(vehicle);
        }catch(err){
            logger.error(`Error while updating vehicle : ${err.stack}`);
            console.log(err);
            res.status(500).send('Error while updating vehicle');
        }
    },

    deleteVehicle: async (req, res) => {
        try{
            const vehicle = await Vehicle.destroy({
                where: { id: req.params.id }
            });
            res.json(vehicle);
        }catch(err){
            logger.error(`Error while deleting vehicle : ${err.stack}`);
            res.status(500).send('Error while deleting vehicle');
        }
    },

    searchVehicle: async (req, res) => {
        try {
            const whereClause = {};
            if (req.query.mark) {
                whereClause.mark = req.query.mark;
            }
            if (req.query.model) {
                whereClause.model = req.query.model;
            }
            if (req.query.agency_id) {
                whereClause.agency_id = req.query.agency_id;
            }


            const vehicles = await Vehicle.findAll({
                where: whereClause,
                include: ['location']
            });
            res.json(vehicles);
        } catch(err) {
            logger.error(`Error while searching vehicles : ${err.stack}`);
            res.status(500).send('Error while searching vehicles');
        }
    }
}

module.exports = vehicleController;