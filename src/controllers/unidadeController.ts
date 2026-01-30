import prisma from '../prisma/client';
import { Request, Response } from 'express';

export const listarUnidades = async (req: Request, res: Response) => {
  const unidades = await prisma.unidade.findMany();
  res.render('unidades', { unidades });
};

export const cadastrarUnidade = async (req: Request, res: Response) => {
  try {
    await prisma.unidade.create({
      data: req.body
    });
    res.redirect('/unidades');
  } catch (error) {
    res.status(400).send('Erro ao cadastrar unidade: ' + error);
  }
};

export const editarUnidade = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    await prisma.unidade.update({
      where: { id: Number(id) },
      data: req.body
    });
    res.redirect('/unidades');
  } catch (error) {
    res.status(400).send('Erro ao editar unidade: ' + error);
  }
};

export const excluirUnidade = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    await prisma.unidade.delete({
      where: { id: Number(id) }
    });
    res.redirect('/unidades');
  } catch (error) {
    res.status(400).send('Erro ao excluir unidade: ' + error);
  }
};
