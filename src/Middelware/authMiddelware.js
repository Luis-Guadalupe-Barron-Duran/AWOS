const jwt = require('jsonwebtoken');

module.exports= (require, res, next) =>{
    const token= require.header('Authorization');
    if (!token){
        return res.status(401).json({msg:"Acceso denegado. No hay Token"});
    }
    try{
        const tokenlimpio=token.replace("Bearer ", "");
        const decoded= jwt.verify(tokenlimpio, process.env.JWT_SECRET);
        require.usuario= decoded;
        next();
    } catch (error){
        res.status(401).json({ msg:"Token no valido o expirado"});
    }
};