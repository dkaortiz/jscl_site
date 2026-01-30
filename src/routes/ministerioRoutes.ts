import { Router } from 'express';
import { listarMinisterios, cadastrarMinisterio, editarMinisterio, excluirMinisterio } from '../controllers/ministerioController';

const router = Router();

router.get('/', listarMinisterios);
router.post('/cadastrar', cadastrarMinisterio);
router.post('/editar/:id', editarMinisterio);
router.post('/excluir/:id', excluirMinisterio);

export default router;
