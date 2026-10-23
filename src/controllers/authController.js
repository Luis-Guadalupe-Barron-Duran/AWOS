const pool=require('../config/db');
const bcrypt=require('bcryptjs');

const register= async(req,res)=>{
const {email, password}=req.body;
    try {
        if (typeof email !== 'string' || !email.trim() || typeof password !== 'string' || password.length < 8) {
            return res.status(400).json({
                msg: 'El correo es obligatorio y la contraseña debe tener al menos 8 caracteres'
            });
        }

        const userExist=await pool.query('SELECT * FROM usuarios WHERE email= $1', [email]);
        if(userExist.rows.length>0){
            return res.status(400).json({msg:"El usuario ya existe"});
        }
        const salt=await bcrypt.genSalt(10);
        const passwordHash=await bcrypt.hash(password, salt);
        const newUser= await pool.query (
            'INSERT INTO usuarios (email, password, role) VALUES ($1, $2, $3) RETURNING id, email, role',
            [email.trim(), passwordHash, 'user']
        );
        res.status(201).json({
            msg: "Usuario registrado con exito",
            user: newUser.rows[0]
        });
    } catch (error) {
        console.error(error);
        res.status(500).json({error: "Error en el servidor"

        });
    }
};
const jwt = require('jsonwebtoken');
const login = async (req, res) => {
    const { email, password } = req.body;

    try{
        if (typeof email !== 'string' || typeof password !== 'string') {
            return res.status(400).json({ msg: "Credenciales inválidas" });
        }

        const result = await pool.query('SELECT * FROM usuarios WHERE email = $1', [email]);
        if (result.rows.length === 0) {
            return res.status(400).json({ msg: "Credenciales inválidas" });
        }

        const usuario = result.rows[0];
        const isMatch = await bcrypt.compare(password, usuario.password);

        if (!isMatch) {
            return res.status(400).json({ msg: "Credenciales inválidas" });
        }

        const payload = { 
            id: usuario.id,
            role: usuario.role,
            email: usuario.email
        };

        if (!process.env.JWT_SECRET) {
            console.error('JWT_SECRET no está configurado');
            return res.status(500).json({ msg: "Error de configuración del servidor" });
        }

        const token = jwt.sign(
            payload, 
            process.env.JWT_SECRET, 
            { expiresIn: '1h' }
        );


        res.json({ 
            msg: "Bienvenido",
            token: token 
        });

    } catch (error) {
        console.log(error);
        res.status(500).json({ error: "Error en el servidor" });
    }
};
module.exports = { register, login };