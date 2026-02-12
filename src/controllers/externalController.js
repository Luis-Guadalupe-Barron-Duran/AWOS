const pool = require('../config/db');

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
        const query= `SELECT * FROM productos WHERE nombre ILIKE $1`
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

module.exports = { poblarProductos, obtenerc, obtenerp };