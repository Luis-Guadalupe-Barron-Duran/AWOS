const jwt = require('jsonwebtoken');

module.exports= (req, res, next) =>{
    const authorization = req.header('Authorization');
    if (!authorization){
        return res.status(401).json({msg:"Acceso denegado. No hay Token"});
    }

    const [scheme, token] = authorization.trim().split(/\s+/);
    if (scheme !== 'Bearer' || !token) {
        return res.status(401).json({msg:"Formato de autorización inválido"});
    }

    if (!process.env.JWT_SECRET) {
        console.error('JWT_SECRET no está configurado');
        return res.status(500).json({msg:"Error de configuración del servidor"});
    }

    try{
        const decoded= jwt.verify(token, process.env.JWT_SECRET);
        req.usuario= decoded;
        next();
    } catch (error){
        res.status(401).json({ msg:"Token no valido o expirado"});
    }
};