import prisma from '../prisma/client';
import { Request, Response } from 'express';

export const listarPedidosOracao = async (req: Request, res: Response) => {
  const pedidos = await prisma.pedidoOracao.findMany({
    include: { unidade: true }
  });
  res.render('pedidosOracao', { pedidos });
};

export const cadastrarPedidoOracao = async (req: Request, res: Response) => {
  try {
    await prisma.pedidoOracao.create({
      data: req.body
    });
    res.redirect('/pedidos-oracao');
  } catch (error) {
    res.status(400).send('Erro ao cadastrar pedido: ' + error);
  }
};

export const editarPedidoOracao = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    await prisma.pedidoOracao.update({
      where: { id: Number(id) },
      data: req.body
    });
    res.redirect('/pedidos-oracao');
  } catch (error) {
    res.status(400).send('Erro ao editar pedido: ' + error);
  }
};

export const excluirPedidoOracao = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    await prisma.pedidoOracao.delete({
      where: { id: Number(id) }
    });
    res.redirect('/pedidos-oracao');
  } catch (error) {
    res.status(400).send('Erro ao excluir pedido: ' + error);
  }
};
