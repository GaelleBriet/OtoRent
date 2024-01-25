const express = require('express');
const authController = require('../controllers/authController');
const routerUser = express.Router();

// users routes

/**
* @openapi
* /auth/register:
*   post:
*     tags:
*       - Auth
*     description: Register a new user with the default role user
*     parameters:
*       - in: body
*         name: name
*         schema:
*           type: string
*         required: true
*       - in: body
*         name: firstname
*         schema:
*           type: string
*         required: true
*       - in: body
*         name: email
*         schema:
*           type: string
*         required: true
*       - in: body
*         name: password
*         schema:
*           type: string
*         required: true
*     responses:
*       200:
*         description: Return the new User.
*/
routerUser.post('/register', authController.register); // Public

/**
* @openapi
* /auth/login:
*   post:
*     tags:
*       - Auth
*     description: Check the login and password and create a new session for the user
*     parameters:
*       - in: body
*         name: email
*         schema:
*           type: string
*         required: true
*       - in: body
*         name: password
*         schema:
*           type: string
*         required: true
*     responses:
*       200:
*         description: Return the connected user and a JWT Token.
*/
routerUser.post('/login', authController.login); // Public

module.exports = routerUser;