import nodemailer from 'nodemailer';
import { Request, Response } from 'express';
import fs from 'fs';
import path from 'path';

export const enviarFichaMembroEmail = async (req: Request, res: Response) => {
  const { email, file } = req.body;
  if (!email || !file) return res.status(400).send('Email e arquivo são obrigatórios');

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
    from: process.env.SMTP_USER,
    to: email,
    subject: 'Ficha Individual do Membro',
    text: 'Segue em anexo a ficha individual do membro.',
    attachments: [
      {
        filename: path.basename(file),
        path: file
      }
    ]
  };

  transporter.sendMail(mailOptions, (error, info) => {
    if (error) {
      return res.status(500).send('Erro ao enviar email: ' + error);
    }
    res.send('Email enviado com sucesso!');
  });
};
