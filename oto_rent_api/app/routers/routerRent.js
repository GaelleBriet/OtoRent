const express = require('express');
const userMiddleware = require('../middlewares/userMiddleware');
const rentController = require('../controllers/rentController');
const routerRent = express.Router();

/**
* @openapi
* /rentals/{id}:
*   get:
*     tags:
*       - Rentals
*     description: Return a specific rental from his id.
*     parameters:
*       - in: path
*         name: id
*         schema:
*           type: integer
*         required: true
*     responses:
*       200:
*         description: Return the rental.
*       401:
*         description: You have to been logged to use this route.
*/
routerRent.get('/:id', userMiddleware.checkIfLoggedin, rentController.getRent); // logged

/**
* @openapi
* /rentals:
*   post:
*     tags:
*       - Rentals
*     description: Return the new rental.
*     parameters:
*       - in: body
*         name: vehicle_id
*         schema:
*           type: integer
*         required: true
*         description: The id of the new vehicle.
*       - in: body
*         name: day
*         schema:
*           type: date
*         required: true
*         description: The new rental date.
*     responses:
*       200:
*         description: Return the rental.
*       401:
*         description: You have to been logged to use this route.
*/
routerRent.post('/', userMiddleware.checkIfLoggedin, rentController.createRent); // logged

/**
* @openapi
* /rentals/{id}:
*   put:
*     tags:
*       - Rentals
*     description: Update a specific rental.
*     parameters:
*       - in: path
*         name: id
*         schema:
*           type: integer
*         required: true
*       - in: body
*         name: vehicle_id
*         schema:
*           type: integer
*         required: false
*         description: The id of the new vehicle if it changes.
*       - in: body
*         name: day
*         schema:
*           type: date
*         required: false
*         description: The new rental date if it changes.
*     responses:
*       200:
*         description: Return the rental.
*       401:
*         description: You have to been logged to use this route.
*/
routerRent.put('/:id', userMiddleware.checkIfLoggedin, rentController.updateRent); // logged

/**
* @openapi
* /rentals/{id}:
*   delete:
*     tags:
*       - Rentals
*     description: Remove a specific rent from his id.
*     parameters:
*       - in: path
*         name: id
*         schema:
*           type: integer
*         required: true
*     responses:
*       200:
*         description: Return the removed rental.
*       401:
*         description: You have to been logged to use this route.
*/
routerRent.delete('/:id', userMiddleware.checkIfLoggedin, rentController.deleteRent); // logged

module.exports = routerRent;