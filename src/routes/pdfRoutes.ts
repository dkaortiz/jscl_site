import { Router } from 'express';
import { gerarFichaMembroPDF } from '../controllers/pdfController';

const router = Router();

router.get('/ficha-membro/:id', gerarFichaMembroPDF);

export default router;
