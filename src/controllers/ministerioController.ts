import prisma from '../prisma/client';
import { Request, Response } from 'express';

export const listarMinisterios = async (req: Request, res: Response) => {
  const ministerios = await prisma.ministerio.findMany();
  res.render('ministerios', { ministerios });
};

export const cadastrarMinisterio = async (req: Request, res: Response) => {
  try {
    await prisma.ministerio.create({
      data: req.body
    });
    res.redirect('/ministerios');
  } catch (error) {
    res.status(400).send('Erro ao cadastrar ministério: ' + error);
  }
};

export const editarMinisterio = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    await prisma.ministerio.update({
      where: { id: Number(id) },
      data: req.body
    });
    res.redirect('/ministerios');
  } catch (error) {
    res.status(400).send('Erro ao editar ministério: ' + error);
  }
};

export const excluirMinisterio = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    await prisma.ministerio.delete({
      where: { id: Number(id) }
    });
    res.redirect('/ministerios');
  } catch (error) {
    res.status(400).send('Erro ao excluir ministério: ' + error);
  }
};
