const express = require('express');
const userMiddleware = require('../middlewares/userMiddleware');
const vehicleController = require('../controllers/vehicleController');
const routerSearch = express.Router();

/**
* @openapi
* /search/vehicles:
*   post:
*     tags:
*       - Search
*     description: Find a list of vehicles with the given criter
*     parameters:
*       - in: body
*         name: mark
*         schema:
*           type: string
*         required: false
*       - in: body
*         name: model
*         schema:
*           type: string
*         required: false
*       - in: body
*         name: agency_id
*         schema:
*           type: integer
*         required: false
*     responses:
*       200:
*         description: Return a list corresponding of criterias.
*       401:
*         description: You have to been logged as FleetManager to use this route.
*/
routerSearch.get('/vehicles' , userMiddleware.checkIfFleetManager,  vehicleController.searchVehicle); // FM

module.exports = routerSearch;
