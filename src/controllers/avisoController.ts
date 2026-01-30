import prisma from '../prisma/client';
import { Request, Response } from 'express';

export const listarAvisos = async (req: Request, res: Response) => {
  const avisos = await prisma.aviso.findMany({
    include: { unidade: true }
  });
  res.render('avisos', { avisos });
};

export const cadastrarAviso = async (req: Request, res: Response) => {
  try {
    await prisma.aviso.create({
      data: req.body
    });
    res.redirect('/avisos');
  } catch (error) {
    res.status(400).send('Erro ao cadastrar aviso: ' + error);
  }
};

export const editarAviso = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    await prisma.aviso.update({
      where: { id: Number(id) },
      data: req.body
    });
    res.redirect('/avisos');
  } catch (error) {
    res.status(400).send('Erro ao editar aviso: ' + error);
  }
};

export const excluirAviso = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    await prisma.aviso.delete({
      where: { id: Number(id) }
    });
    res.redirect('/avisos');
  } catch (error) {
    res.status(400).send('Erro ao excluir aviso: ' + error);
  }
};
