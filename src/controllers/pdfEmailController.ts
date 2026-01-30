import PDFDocument from 'pdfkit';
import nodemailer from 'nodemailer';
import { Request, Response } from 'express';
import prisma from '../prisma/client';
import fs from 'fs';
import path from 'path';

export const gerarEEnviarFichaMembro = async (req: Request, res: Response) => {
  const { id, email } = req.body;
  if (!id || !email) return res.status(400).send('ID do membro e email são obrigatórios');

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

  stream.on('finish', async () => {
    const transporter = nodemailer.createTransport({
      host: process.env.SMTP_HOST,
      port: Number(process.env.SMTP_PORT),
      secure: false,
      auth: {
        user: process.env.SMTP_USER,
        pass: process.env.SMTP_PASS
      }
    });

    const mailOptions = {
      from: process.env.FROM_EMAIL,
      to: email,
      subject: 'Ficha Individual do Membro',
      text: 'Segue em anexo a ficha individual do membro.',
      attachments: [
        {
          filename: `ficha-membro-${id}.pdf`,
          path: filePath
        }
      ]
    };

    transporter.sendMail(mailOptions, (error, info) => {
      fs.unlinkSync(filePath);
      if (error) {
        return res.status(500).send('Erro ao enviar email: ' + error);
      }
      res.send('PDF gerado e email enviado com sucesso!');
    });
  });
};
