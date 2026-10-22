const pool = require('../config/db');

const validarDatosProducto = ({ nombre, precio, stock, latitud, longitud }) => {
    if (typeof nombre !== 'string' || !nombre.trim() || precio === undefined || stock === undefined) {
        return 'Nombre, precio y stock son obligatorios';
    }

    const precioNumero = Number(precio);
    const stockNumero = Number(stock);
    const latitudNumero = latitud === null || latitud === undefined || latitud === '' ? null : Number(latitud);
    const longitudNumero = longitud === null || longitud === undefined || longitud === '' ? null : Number(longitud);

    if (!Number.isFinite(precioNumero) || precioNumero < 0 || precioNumero > 99999999.99) {
        return 'El precio debe ser un número entre 0 y 99999999.99';
    }
    if (!Number.isInteger(stockNumero) || stockNumero < 0) {
        return 'El stock debe ser un número entero mayor o igual a 0';
    }
    if (latitudNumero !== null && (!Number.isFinite(latitudNumero) || latitudNumero < -90 || latitudNumero > 90)) {
        return 'La latitud debe estar entre -90 y 90';
    }
    if (longitudNumero !== null && (!Number.isFinite(longitudNumero) || longitudNumero < -180 || longitudNumero > 180)) {
        return 'La longitud debe estar entre -180 y 180';
    }

    return null;
};

const poblarProductos = async (request, response) => {
    try {
        // Fetch FakeStoreApi
        const apiFetch = await fetch('http://fakestoreapi.com/products');
        const products = await apiFetch.json();

        let inserciones = 0;
        // Destructurar el objeto
        for(const product of products){
            const { title, price, description, image, category} = product;
            
            const stock = Math.floor(Math.random() * 50) + 1;
            const cquery=`
                INSERT INTO categoria (nombre)
                VALUES ($1)
                ON CONFLICT (nombre)
                DO UPDATE SET nombre = EXCLUDED.nombre
                RETURNING id
            `
            const categoria= await pool.query(cquery, [category]);
            const id_categoria= categoria.rows[0].id
            const query = `
                INSERT INTO productos
                (nombre, precio, stock, descripcion, imagen_url, id_categoria)
                VALUES ($1, $2, $3, $4, $5, $6)
            `

            await pool.query(query, [title, price, stock, description, image, id_categoria]);

            inserciones++;
        }
        response.status(200).json(
            {
                mensaje: "Carga masiva exitosa", 
                cantidad: inserciones
            }
        );
    } catch (error) {
        console.log(`Error: ${error}`);
        response.status(500).json({error: error.message})
    }
};
const obtenerp=async (req, res) =>{
try{
    const {nombre} = req.params;
        const query= `SELECT 
            p.id,
            p.nombre,
            p.precio,
            p.stock,
            p.descripcion,
            p.imagen_url,
            p.id_categoria,
            p.youtube_id,
            p.latitud,
            p.longitud,
            c.nombre AS categoria_nombre
            FROM productos p
            INNER JOIN categoria c ON p.id_categoria = c.id
            WHERE p.nombre ILIKE $1
        `
        const { rows } = await pool.query(query, [`%${nombre}%`]);
        res.json(rows);
    } catch(error){
        console.error(error);
        res.status(500).json({ error: 'Error al leer bd' });
    }
};
const obtenerc=async (req, res) =>{
try{
    const {nombre} = req.params;
        const query= `SELECT * FROM categoria WHERE nombre ILIKE $1`
        const { rows } = await pool.query(query, [`%${nombre}%`]);
        res.json(rows);
    } catch(error){
        console.error(error);
        res.status(500).json({ error: 'Error al leer bd' });
    }
};
const buscarProductos = async (req, res) => {
    try {
        const { q } = req.query;

        if (!q || !q.trim()) {
            return res.status(400).json({
                 error: 'No se envio ningun parametro' 
                });
        }
        const query = `SELECT 
            p.id,
            p.nombre,
            p.precio,
            p.stock,
            p.descripcion,
            p.imagen_url,
            p.id_categoria,
            p.youtube_id,
            p.latitud,
            p.longitud,
            c.nombre AS categoria_nombre
            FROM productos p INNER JOIN categoria c ON p.id_categoria = c.id
            WHERE p.nombre ILIKE $1 OR p.descripcion ILIKE $1`;

        const { rows } = await pool.query(query, [`%${q}%`]);
        return res.json(rows);
    } catch (error) {
        console.error(error);
        return res.status(500).json({ error: 'Error al leer bd' });
    }
};
const obtenerProductos = async (req, res) => {
  try {
    const query = `
            SELECT 
                id,
                nombre,
                precio,
                stock,
                descripcion,
                imagen_url,
                id_categoria,
                youtube_id,
                latitud,
                longitud
            FROM productos`;
    const { rows } = await pool.query(query);
    res.json(rows);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error al leer bd' });
  }
};
const crearProducto= async (req,res) =>{
    const { nombre, precio, stock, descripcion, imagen_url, id_categoria, youtube_id, latitud, longitud } = req.body;
    const errorValidacion = validarDatosProducto(req.body);
    if (errorValidacion) {
        return res.status(400).json({ error: errorValidacion });
    }

    try {
        const query= `INSERT INTO productos(nombre, precio, stock, descripcion, imagen_url, id_categoria, youtube_id, latitud, longitud) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)`;
        await pool.query(query, [
            nombre.trim(), Number(precio), Number(stock), descripcion || null,
            imagen_url || null, id_categoria || null, youtube_id || null,
            latitud === '' ? null : latitud, longitud === '' ? null : longitud
        ]);
        res.status(201).json({ msj: "Producto creado exitosamente" });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Error al crear producto' });
    }
};

const actualizarProducto = async (req, res) => {
    const { id } = req.params;
    const { nombre, precio, stock, descripcion, imagen_url, id_categoria, youtube_id, latitud, longitud } = req.body;
    const errorValidacion = validarDatosProducto(req.body);
    if (errorValidacion) {
        return res.status(400).json({ error: errorValidacion });
    }

    try {
        const query = `
            UPDATE productos
            SET nombre = $1, precio = $2, stock = $3, descripcion = $4,
                imagen_url = $5, id_categoria = $6, youtube_id = $7,
                latitud = $8, longitud = $9
            WHERE id = $10
            RETURNING id, nombre, precio, stock, descripcion, imagen_url,
                      id_categoria, youtube_id, latitud, longitud
        `;
        const { rows } = await pool.query(query, [
            nombre.trim(), Number(precio), Number(stock), descripcion || null,
            imagen_url || null, id_categoria || null, youtube_id || null,
            latitud === '' ? null : latitud, longitud === '' ? null : longitud, id
        ]);
        if (rows.length === 0) {
            return res.status(404).json({ error: 'Producto no encontrado' });
        }
        res.json(rows[0]);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Error al actualizar producto' });
    }
};


module.exports = { poblarProductos, obtenerc, obtenerp, buscarProductos, obtenerProductos, crearProducto, actualizarProducto };
