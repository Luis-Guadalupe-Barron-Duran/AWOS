const express = require('express');
const { poblarProductos, obtenerc } = require('../controllers/externalController');
const router = express.Router();

router.post('/:poblar', poblarProductos);

router.get('/:nombre', obtenerc);

module.exports = router;