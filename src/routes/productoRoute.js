
const express = require('express');
const { poblarProductos, obtenerc, obtenerp, buscarProductos, obtenerProductos, crearProducto, actualizarProducto} = require('../controllers/externalController');
const authMiddelware = require('../Middelware/authMiddelware');
const roleMiddleware = require('../Middelware/roleMiddleware');
const apiKeyMiddleware = require('../Middelware/apiKeyMiddleware');
const router = express.Router();

router.get('/productos', obtenerProductos);
router.post(
    '/productos/poblar',
    apiKeyMiddleware,
    authMiddelware,
    roleMiddleware('admin'),
    poblarProductos
);
router.post('/productos/', authMiddelware, roleMiddleware('admin'), crearProducto);
router.put('/productos/:id', authMiddelware, roleMiddleware('admin'), actualizarProducto);
router.get('/productos/search', buscarProductos);
router.get('/productos/:nombre', obtenerp);
router.get('/categoria/:nombre', obtenerc);
module.exports = router;