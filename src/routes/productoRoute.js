
const express = require('express');
const { poblarProductos, obtenerc, obtenerp, buscarProductos, obtenerProductos, crearProducto} = require('../controllers/externalController');
const authMiddelware = require('../Middelware/authMiddelware');
const router = express.Router();

router.get('/productos', obtenerProductos);
router.post('/productos/poblar', poblarProductos);
router.post('/productos/', authMiddelware,crearProducto);
router.get('/productos/search', buscarProductos);
router.get('/productos/:nombre', obtenerp);
router.get('/categoria/:nombre', obtenerc);
module.exports = router;