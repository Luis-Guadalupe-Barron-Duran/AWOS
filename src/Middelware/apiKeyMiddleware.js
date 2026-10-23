module.exports = (req, res, next) => {
    const apiKeyConfigurada = process.env.API_KEY;
    const apiKeyRecibida = req.header('X-API-Key');

    if (!apiKeyConfigurada) {
        console.error('API_KEY no está configurada');
        return res.status(500).json({
            error: 'Error de configuración del servidor'
        });
    }

    if (!apiKeyRecibida || apiKeyRecibida !== apiKeyConfigurada) {
        return res.status(401).json({
            error: 'API key inválida o ausente'
        });
    }

    next();
};
