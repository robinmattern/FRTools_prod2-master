import express from 'express';
import cors from 'cors';

const app = express();
const nPort = 3250;

app.use( cors() );

app.get('/api', (req, res) => {
  res.send( `<h4 style="margin:-10px 0 0 20px;">.. from the formR s00_Sample-Server-API at 127.0.0.1:${nPort}/api</h4>` );
  });

app.listen( nPort, () => {
//console.log(`  Server running at http://localhost:${nPort}/api`);
  });