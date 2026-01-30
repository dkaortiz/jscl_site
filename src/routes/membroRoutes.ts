import { Router } from 'express';
import { listarMembros, cadastrarMembro, editarMembro, excluirMembro } from '../controllers/membroController';

const router = Router();

router.get('/', listarMembros);
router.post('/cadastrar', cadastrarMembro);
router.post('/editar/:id', editarMembro);
router.post('/excluir/:id', excluirMembro);

export default router;
