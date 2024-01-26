
const {Agency} = require('../models/');
const logger = require('../helpers/logger');

const agencyController = {
    getAgencies: async (req, res) => {
        try{
            const agencies = await Agency.findAll();
            res.json(agencies);
        }catch(err){
            logger.error(`Error while getting agencies: ${err.stack}`);
            res.status(500).send('Error while getting agencies');
        }
    }
};

module.exports = agencyController;