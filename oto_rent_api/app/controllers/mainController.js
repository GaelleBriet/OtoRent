
const mainController = {
    index: (req, res) => {
        const properties = {
            title: `O'to API`,
            version: '1.0.0',
        };
        res.json(properties);
    }
}

module.exports = mainController;