import PDFDocument from 'pdfkit';
import { Request, Response } from 'express';
import prisma from '../prisma/client';
import fs from 'fs';
import path from 'path';

export const gerarFichaMembroPDF = async (req: Request, res: Response) => {
  const { id } = req.params;
  const membro = await prisma.membro.findUnique({ where: { id: Number(id) } });
  if (!membro) return res.status(404).send('Membro não encontrado');

  const doc = new PDFDocument();
  const filePath = path.join(__dirname, `../../dist/ficha-membro-${id}.pdf`);
  const stream = fs.createWriteStream(filePath);
  doc.pipe(stream);

  doc.fontSize(20).text('Ficha Individual do Membro', { align: 'center' });
  doc.moveDown();
  doc.fontSize(12).text(`Nome: ${membro.nome}`);
  doc.text(`Email: ${membro.email || ''}`);
  doc.text(`Telefone: ${membro.telefone || ''}`);
  doc.text(`CPF: ${membro.cpf || ''}`);
  doc.text(`Status: ${membro.status || ''}`);
  doc.text(`Unidade: ${membro.unidadeId}`);
  doc.text(`Cargo: ${membro.cargoEclesiastico || ''}`);
  doc.text(`Função: ${membro.funcao || ''}`);
  doc.text(`Observações: ${membro.observacoes || ''}`);
  doc.text(`Data de Cadastro: ${membro.createdAt.toLocaleString()}`);

  doc.end();

  stream.on('finish', () => {
    res.download(filePath, `ficha-membro-${id}.pdf`, err => {
      if (err) res.status(500).send('Erro ao baixar PDF');
      fs.unlinkSync(filePath);
    });
  });
};
