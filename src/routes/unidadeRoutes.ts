import { Router } from 'express';
import { listarUnidades, cadastrarUnidade, editarUnidade, excluirUnidade } from '../controllers/unidadeController';

const router = Router();

router.get('/', listarUnidades);
router.post('/cadastrar', cadastrarUnidade);
router.post('/editar/:id', editarUnidade);
router.post('/excluir/:id', excluirUnidade);

export default router;
