const express = require('express');

const agencyRouter = require('./routerAgency');
const rentRouter = require('./routerRent');
const authRouter = require('./routerAuth');
const vehicleRouter = require('./routerVehicle');
const searchRouter = require('./routerSearch');
// Chargement des modules
const mainController = require('../controllers/mainController');

const router = express.Router();

router.get('/', mainController.index);


router.use('/agencies', agencyRouter);
router.use('/rentals', rentRouter);
router.use('/auth', authRouter);
router.use('/vehicles', vehicleRouter);
router.use('/search', searchRouter);

module.exports = router;