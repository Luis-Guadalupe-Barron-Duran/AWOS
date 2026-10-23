const express = require('express');
const cors = require('cors');
const rateLimit = require('express-rate-limit');
const  router  = require('./routes/productoRoute');
const  router2  = require('./routes/authRoutes');
require('dotenv').config();

const app = express();

const generalLimiter = rateLimit({
    windowMs: 15 * 60 * 1000,
    limit: 100,
    standardHeaders: 'draft-8',
    legacyHeaders: false,
    message: {
        error: 'Demasiadas solicitudes. Intenta nuevamente más tarde.'
    }
});

const authLimiter = rateLimit({
    windowMs: 15 * 60 * 1000,
    limit: 5,
    standardHeaders: 'draft-8',
    legacyHeaders: false,
    message: {
        error: 'Demasiados intentos de autenticación. Intenta nuevamente más tarde.'
    }
});

app.use(cors());
app.use(express.json());

app.use('/api', generalLimiter);
app.use('/api/auth', authLimiter);
app.use('/api', router);
app.use('/api/auth', router2);

const PORT = process.env.PORT || 4000;
app.listen(PORT, () => console.log("Servicio arriba"));