const express = require('express');

const app = express();
const port = 8080;

app.get('/', (req, res) => {
    res.sendFile(__dirname + '/index.html');
});

app.get('/ip', (req, res) => {
    let ip = req.headers['x-forwarded-for'] || req.connection.remoteAddress;
    
    // Eliminar la parte "::ffff:" si está presente
    if (ip.substr(0, 7) === '::ffff:') {
        ip = ip.substr(7);
    }
    res.send(ip);
});

app.listen(port, () => {
    console.log(`Servidor Node.js escuchando en http://localhost:${port}`);
});
