import { Router } from 'express';
import { listarAcoesSociais, cadastrarAcaoSocial, editarAcaoSocial, excluirAcaoSocial } from '../controllers/acaoSocialController';

const router = Router();

router.get('/', listarAcoesSociais);
router.post('/cadastrar', cadastrarAcaoSocial);
router.post('/editar/:id', editarAcaoSocial);
router.post('/excluir/:id', excluirAcaoSocial);

export default router;
