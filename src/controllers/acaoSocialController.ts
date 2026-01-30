import prisma from '../prisma/client';
import { Request, Response } from 'express';

export const listarAcoesSociais = async (req: Request, res: Response) => {
  const acoes = await prisma.acaoSocial.findMany();
  res.render('acoesSociais', { acoes });
};

export const cadastrarAcaoSocial = async (req: Request, res: Response) => {
  try {
    await prisma.acaoSocial.create({
      data: req.body
    });
    res.redirect('/acoes-sociais');
  } catch (error) {
    res.status(400).send('Erro ao cadastrar ação social: ' + error);
  }
};

export const editarAcaoSocial = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    await prisma.acaoSocial.update({
      where: { id: Number(id) },
      data: req.body
    });
    res.redirect('/acoes-sociais');
  } catch (error) {
    res.status(400).send('Erro ao editar ação social: ' + error);
  }
};

export const excluirAcaoSocial = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    await prisma.acaoSocial.delete({
      where: { id: Number(id) }
    });
    res.redirect('/acoes-sociais');
  } catch (error) {
    res.status(400).send('Erro ao excluir ação social: ' + error);
  }
};
