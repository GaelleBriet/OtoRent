// Chargement des modules
const logger = require('./app/helpers/logger');
const express = require('express');
const router = require('./app/routers/');
require('dotenv').config();
const userMiddleware = require('./app/middlewares/userMiddleware');
const swaggerUi = require('swagger-ui-express');
const swaggerJSDoc = require('swagger-jsdoc');

// Configuration de swagger
const options = {
    definition: {
      openapi: '3.0.0',
      info: {
        title: `O'To API`,
        version: '1.0.0',
      },
    },
    apis: ['./app/routers/router*.js'], // files containing annotations as above
  };


const swaggerSpec = swaggerJSDoc(options);

// Création de l'application
const app = express();
const PORT = process.env.SERVER_PORT || 3000;

// Configuration de l'application
app.use(express.json());
app.use(express.urlencoded({ extended: true }));



app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerSpec));
app.use(router);

// Démarrage du serveur
app.listen(PORT, () => {
    logger.info(`Server listening on http://localhost:${PORT}`);
});