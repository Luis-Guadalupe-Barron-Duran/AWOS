const express = require('express');
const { poblarProductos, obtenerc, obtenerp, buscarProductos, obtenerProductos } = require('../controllers/externalController');
const router = express.Router();

router.get('/productos', obtenerProductos);
router.post('/productos/poblar', poblarProductos);
router.get('/productos/search', buscarProductos);
router.get('/productos/:nombre', obtenerp);
router.get('/categoria/:nombre', obtenerc);
module.exports = router;