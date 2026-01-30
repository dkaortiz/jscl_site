import prisma from '../prisma/client';
import { Request, Response } from 'express';

export const listarSolicitacoes = async (req: Request, res: Response) => {
  const solicitacoes = await prisma.solicitacaoReativacao.findMany();
  res.render('solicitacoesReativacao', { solicitacoes });
};

export const cadastrarSolicitacao = async (req: Request, res: Response) => {
  try {
    await prisma.solicitacaoReativacao.create({
      data: req.body
    });
    res.redirect('/solicitacoes-reativacao');
  } catch (error) {
    res.status(400).send('Erro ao cadastrar solicitação: ' + error);
  }
};

export const editarSolicitacao = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    await prisma.solicitacaoReativacao.update({
      where: { id: Number(id) },
      data: req.body
    });
    res.redirect('/solicitacoes-reativacao');
  } catch (error) {
    res.status(400).send('Erro ao editar solicitação: ' + error);
  }
};

export const excluirSolicitacao = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    await prisma.solicitacaoReativacao.delete({
      where: { id: Number(id) }
    });
    res.redirect('/solicitacoes-reativacao');
  } catch (error) {
    res.status(400).send('Erro ao excluir solicitação: ' + error);
  }
};
