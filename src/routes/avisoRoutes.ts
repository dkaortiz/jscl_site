import { Router } from 'express';
import { listarAvisos, cadastrarAviso, editarAviso, excluirAviso } from '../controllers/avisoController';

const router = Router();

router.get('/', listarAvisos);
router.post('/cadastrar', cadastrarAviso);
router.post('/editar/:id', editarAviso);
router.post('/excluir/:id', excluirAviso);

export default router;
