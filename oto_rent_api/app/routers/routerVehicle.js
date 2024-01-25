const express = require('express');
const vehicleController = require('../controllers/vehicleController');
const userMiddleware = require('../middlewares/userMiddleware');
const routerVehicles = express.Router();

// Vehicles routes

/**
 * @openapi
 * /vehicles:
 *   get:
 *     tags:
 *     - Vehicles
 *     description: Returns a list of all vehicles.
 *     responses:
 *       200:
 *         description: Returns a list of all vehicles.
 */
routerVehicles.get('/', vehicleController.getVehicles);// Public

/**
 * @openapi
 *   /vehicles/{id}:
 *     get:
 *       tags:
 *       - Vehicles
 *       description: Returns a specific vehicle from his id.
 *       parameters:
 *       - in: path
 *         name: id
 *         schema:
 *           type: integer
 *         required: true
 *         description: Numeric ID of the vehicle to get
 *       responses:
 *         200:
 *           description: Returns a specific vehicle from his id..
    */
routerVehicles.get('/:id', vehicleController.getVehicle);// Public

/**
* @openapi
* /vehicles:
*   post:
*     tags:
*       - Vehicles
*     description: Add a new vehicle.
*     parameters:
*       - in: body
*         name: mark
*         schema:
*           type: string
*         required: true
*       - in: body
*         name: model
*         schema:
*           type: string
*         required: true
*       - in: body
*         name: zeroto100
*         schema:
*           type: integer
*         required: true
*       - in: body
*         name: topspeed
*         schema:
*           type: integer
*         required: true
*       - in: body
*         name: ecoclass
*         schema:
*           type: string
*         required: true
*       - in: body
*         nauth/loginame: power
*         schema:
*           type: integer
*         required: true
*       - in: body
*         name: picture
*         schema:
*           type: string
*         required: false
*       - in: body
*         name: price
*         schema:
*           type: integer
*         required: true
*     responses:
*       200:
*         description: Return the inserted vehicule.
*       401:
*         description: You have to been logged as FleetManager to use this route.
*/
routerVehicles.post('/', userMiddleware.checkIfFleetManager, vehicleController.createVehicle); // FM

/**
* @openapi
* /vehicles/{id}:
*   put:
*     tags:
*       - Vehicles
*     description: Edit an existing vehicle.
*     parameters:
*       - in: path
*         name: id
*         schema:
*           type: integer
*         required: true
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
*         name: zeroto100
*         schema:
*           type: integer
*         required: false
*       - in: body
*         name: topspeed
*         schema:
*           type: integer
*         required: false
*       - in: body
*         name: ecoclass
*         schema:
*           type: string
*         required: false
*       - in: body
*         name: power
*         schema:
*           type: integer
*         required: false
*       - in: body
*         name: picture
*         schema:
*           type: string
*         required: false
*       - in: body
*         name: price
*         schema:
*           type: integer
*         required: false
*     responses:
*       200:
*         description: Return the edited vehicule.
*       401:
*         description: You have to been logged as FleetManager to use this route.
*/
routerVehicles.put('/:id', userMiddleware.checkIfFleetManager, vehicleController.updateVehicle); // FM

/**
* @openapi
* /vehicles/{id}:
*   delete:
*     tags:
*       - Vehicles
*     description: Remove an existing vehicle.
*     parameters:
*       - in: path
*         name: id
*         schema:
*           type: string
*         required: true
*     responses:
*       200:
*         description: Return the removed vehicule.
*       401:
*         description: You have to been logged as FleetManager to use this route.
*/
routerVehicles.delete('/:id', userMiddleware.checkIfFleetManager, vehicleController.deleteVehicle); // FM

module.exports = routerVehicles;