const { Account } = require('../models');
const logger = require('../helpers/logger');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
require('dotenv').config

const authController = {
    login: async (req, res) => {
        try {
            const user = await Account.findOne({
                attributes: ['id', 'email', 'role', 'firstname', 'name', 'password'],
                where: {
                    email: req.body.email,
                }
            });
            if (user) {

                const isPasswordValid = await bcrypt.compare(req.body.password, user.password);
                if (isPasswordValid) {
                    const token = jwt.sign({ id: user.id, role: user.role }, process.env.JWT_SECRET, { expiresIn: '1h' });

                    res.json({firstname: user.firstname, name: user.name, role: user.role, email: user.email, token: token})
                } else {
                    logger.error('Invalid credentials');
                    res.status(401).send('Invalid credentials');
                }
            } else {
                logger.error('Invalid credentials');
                res.status(401).send('Invalid credentials');
            }
        } catch (err) {
            logger.error(`Error while logging in : ${err.stack}`);
            res.status(500).send('Error while logging in');
        }
    },

    register: async (req, res) => {
        try {
            const userFromBody = req.body;
            const salt = await bcrypt.genSalt(10);
            const hashedPassword = await bcrypt.hash(userFromBody.password, salt);
            userFromBody.password = hashedPassword;
            console.log(req.body);
            console.log(userFromBody);
            const user = await Account.create(req.body);
            res.json(user);
        } catch (err) {
            logger.error(`Error while registering : ${err.stack}`);
            res.status(500).send('Error while registering');
        }
    },
}

module.exports = authController;
