import { Router } from 'express';
import { enviarFichaMembroEmail } from '../controllers/emailController';

const router = Router();

router.post('/enviar-ficha', enviarFichaMembroEmail);

export default router;
