import express from 'express';
import cors from 'cors';

const app = express();
const PORT = 3250;

app.use(cors());

app.get('/api', (req, res) => {
  res.send('<h3>from the formR Server at localhost:3250/api</h3>');
});

app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}/api`);
});