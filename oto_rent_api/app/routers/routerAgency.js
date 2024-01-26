const express = require('express');
const agencyController = require('../controllers/agencyController');
const routerAgency = express.Router();


/**
 * @openapi
 * /agencies:
 *   get:
 *    tags:
 *    - Agency
 *    description: Returns a list of all agencies.
 *    responses:
 *     200:
 *      description: Returns a list of all agencies.
 */
routerAgency.get('/', agencyController.getAgencies); // Public

module.exports = routerAgency;