const { Rent } = require('../models');
const logger = require('../helpers/logger');
const jwt = require('jsonwebtoken');

const rentController = {


    getRent: async (req, res) => {
        try {
            const rent = await Rent.findOne({
                where: { id: req.params.id },
                include: [{
                    association: 'client',
                    attributes: ['id', 'name', 'firstname', 'email', 'role']
                }, 'vehicle']
            });
            res.json(rent);
        } catch (err) {
            logger.error(`Error while getting rent : ${err.stack}`);
            res.status(500).send('Error while getting rent');
        }
    },

    createRent: async (req, res) => {
        try {
            const dataToken = jwt.decode(req.headers.authorization.split(' ')[1]);

            const newRent = {
                account_id: dataToken.id,
                day: req.body.day,
                vehicle_id: req.body.vehicle_id,
            }


            console.log(newRent);
            const rent = await Rent.create(newRent);
            res.json(rent);
        } catch (err) {
            logger.error(`Error while creating rent : ${err.stack}`);
            res.status(500).send('Error while creating rent');
        }
    },

    updateRent: async (req, res) => {
        const dataToken = jwt.decode(req.headers.authorization.split(' ')[1]);

        const newRent = {
            account_id: dataToken.id,
        }

        if(req.body.day) newRent.day = req.body.day;
        if(req.body.vehicle_id) newRent.vehicle_id = req.body.vehicle_id;

        try {
            const rent = await Rent.update(newRent, {
                where: { id: req.params.id }
            });
            res.json(rent);
        } catch (err) {
            logger.error(`Error while updating rent : ${err.stack}`);
            res.status(500).send('Error while updating rent');
        }
    },

    deleteRent: async (req, res) => {
        try {
            const rent = await Rent.destroy({
                where: { id: req.params.id }
            });
            res.json(rent);
        } catch (err) {
            logger.error(`Error while deleting rent : ${err.stack}`);
            res.status(500).send('Error while deleting rent'); console.log(err);
        }
    }
}

module.exports = rentController;