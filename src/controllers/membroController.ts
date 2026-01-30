import prisma from '../prisma/client';
import { Request, Response } from 'express';

export const listarMembros = async (req: Request, res: Response) => {
  const membros = await prisma.membro.findMany({
    include: { unidade: true, user: true }
  });
  res.render('membros', { membros });
};

export const cadastrarMembro = async (req: Request, res: Response) => {
  try {
    const membro = await prisma.membro.create({
      data: req.body
    });
    res.redirect('/membros');
  } catch (error) {
    res.status(400).send('Erro ao cadastrar membro: ' + error);
  }
};

export const editarMembro = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    await prisma.membro.update({
      where: { id: Number(id) },
      data: req.body
    });
    res.redirect('/membros');
  } catch (error) {
    res.status(400).send('Erro ao editar membro: ' + error);
  }
};

export const excluirMembro = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    await prisma.membro.delete({
      where: { id: Number(id) }
    });
    res.redirect('/membros');
  } catch (error) {
    res.status(400).send('Erro ao excluir membro: ' + error);
  }
};
