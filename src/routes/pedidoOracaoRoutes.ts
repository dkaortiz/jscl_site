import { Router } from 'express';
import { listarPedidosOracao, cadastrarPedidoOracao, editarPedidoOracao, excluirPedidoOracao } from '../controllers/pedidoOracaoController';

const router = Router();

router.get('/', listarPedidosOracao);
router.post('/cadastrar', cadastrarPedidoOracao);
router.post('/editar/:id', editarPedidoOracao);
router.post('/excluir/:id', excluirPedidoOracao);

export default router;
