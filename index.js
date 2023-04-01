const express = require('express');
const app = express();
const os = require('os');

const port = 3000;



app.get('/', (req, res) => {
  const ip = req.headers['x-forwarded-for'] || req.connection.remoteAddress;
  const hostname = os.hostname();
  const version = process.env.APP_VERSION || '1.0.0';
  res.send(`Adres IP serwera, na którym aplikacja jest uruchomiona: ${ip}  <br>
            Nazwa serwra (hostname): ${hostname} <br>
            Wersja aplikacji: ${version}`);
});

app.listen(port, () => {
  console.log(`aplikacja nasluchuje na http://localhost:${port}`);
});