import { Router } from 'express';
import { gerarEEnviarFichaMembro } from '../controllers/pdfEmailController';

const router = Router();

router.post('/ficha-membro/enviar', gerarEEnviarFichaMembro);

export default router;
