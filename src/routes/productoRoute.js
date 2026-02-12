const express = require('express');
const { poblarProductos, obtenerc, obtenerp } = require('../controllers/externalController');
const router = express.Router();

router.post('/poblar', poblarProductos);

router.get('/productos/:nombre', obtenerp);
router.get('/categoria/:nombre', obtenerc);
module.exports = router;