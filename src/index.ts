import express from 'express';
import dotenv from 'dotenv';
import path from 'path';
import authRoutes from './routes/authRoutes';
import membroRoutes from './routes/membroRoutes';
import unidadeRoutes from './routes/unidadeRoutes';
import ministerioRoutes from './routes/ministerioRoutes';
import avisoRoutes from './routes/avisoRoutes';
import pedidoOracaoRoutes from './routes/pedidoOracaoRoutes';
import acaoSocialRoutes from './routes/acaoSocialRoutes';
import solicitacaoReativacaoRoutes from './routes/solicitacaoReativacaoRoutes';
import pdfRoutes from './routes/pdfRoutes';
import emailRoutes from './routes/emailRoutes';
import pdfEmailRoutes from './routes/pdfEmailRoutes';

dotenv.config();

const app = express();
app.use(express.json());

// Configurar EJS como view engine
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, '../views'));











app.use('/pdf-email', pdfEmailRoutes);


// Página inicial
app.get('/', (req, res) => {
  res.redirect('/dashboard');
});

// Dashboard
app.get('/dashboard', (req, res) => {
  const user = { name: 'Admin' };
  const unidade = { nome: 'Sede' };
  const membros = [
    { nome: 'João Silva', email: 'joao@email.com' },
    { nome: 'Maria Souza', email: 'maria@email.com' }
  ];
  res.render('dashboard', { user, unidade, membros });
});

// Login
app.get('/login', (req, res) => {
  res.render('login');
});
app.post('/login', (req, res) => {
  // Implementar autenticação real depois
  res.redirect('/dashboard');
});

// Cadastro
app.get('/cadastro', (req, res) => {
  res.render('cadastro');
});
app.post('/cadastro', (req, res) => {
  // Implementar cadastro real depois
  res.redirect('/membros');
});

// ...rotas de membros agora em membroRoutes

// ...rotas de unidades agora em unidadeRoutes

// Avisos
app.get('/avisos', (req, res) => {
  const avisos = [
    { titulo: 'Culto Especial', conteudo: 'Domingo às 19h' },
    { titulo: 'Reunião de Jovens', conteudo: 'Sábado às 18h' }
  ];
  res.render('avisos', { avisos });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});
