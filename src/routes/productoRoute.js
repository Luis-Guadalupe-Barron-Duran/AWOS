
const express = require('express');
const { poblarProductos, obtenerc, obtenerp, buscarProductos, obtenerProductos, crearProducto, actualizarProducto} = require('../controllers/externalController');
const authMiddelware = require('../Middelware/authMiddelware');
const router = express.Router();

router.get('/productos', obtenerProductos);
router.post('/productos/poblar', poblarProductos);
router.post('/productos/', authMiddelware, crearProducto);
router.put('/productos/:id', authMiddelware, actualizarProducto);
router.get('/productos/search', buscarProductos);
router.get('/productos/:nombre', obtenerp);
router.get('/categoria/:nombre', obtenerc);
module.exports = router;