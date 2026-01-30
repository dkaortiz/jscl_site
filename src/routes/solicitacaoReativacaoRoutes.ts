import { Router } from 'express';
import { listarSolicitacoes, cadastrarSolicitacao, editarSolicitacao, excluirSolicitacao } from '../controllers/solicitacaoReativacaoController';

const router = Router();

router.get('/', listarSolicitacoes);
router.post('/cadastrar', cadastrarSolicitacao);
router.post('/editar/:id', editarSolicitacao);
router.post('/excluir/:id', excluirSolicitacao);

export default router;
