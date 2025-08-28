import express from 'express';
import cors from 'cors';

const app = express();
const PORT = 3250;

app.use(cors());

app.get('/api', (req, res) => {
  res.send('<h4 style="margin:-10px 0 0 25px;">.. from the formR s00_Sample-Server-API at localhost:3250/api</h4>');
});

app.listen(PORT, () => {
  console.log(`  Server running at http://localhost:${PORT}/api`);
});