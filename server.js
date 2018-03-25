const express = require('express');
const app = express();

const port = process.env.PORT || 5002;

app.use(express.static('public'))

app.listen(port, function(){
    console.log('Thanks for listening on station', port);

  });