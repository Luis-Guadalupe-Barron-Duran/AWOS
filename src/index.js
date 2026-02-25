const express = require('express');
const cors = require('cors');
const  router  = require('./routes/productoRoute');
const  router2  = require('./routes/authRoutes');
require('dotenv').config();

const app = express();

app.use(cors());
app.use(express.json());

app.use('/api', router);
app.use('/api/auth', router2);

const PORT = process.env.PORT || 4000;
app.listen(PORT, () => console.log("Servicio arriba"));