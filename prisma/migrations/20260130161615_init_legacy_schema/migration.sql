/*
  Warnings:

  - The `dataBatismo` column on the `Membro` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `dataReconciliacao` column on the `Membro` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - A unique constraint covering the columns `[email]` on the table `Membro` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[cpf]` on the table `Membro` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "Membro" ADD COLUMN     "aprovadoPor" INTEGER,
ADD COLUMN     "cadastradoPor" INTEGER,
ADD COLUMN     "cpf" TEXT,
ADD COLUMN     "dataAprovacao" TIMESTAMP(3),
ADD COLUMN     "dataDesativacao" TIMESTAMP(3),
ADD COLUMN     "dataNascimento" TIMESTAMP(3),
ADD COLUMN     "observacoes" TEXT,
ADD COLUMN     "status" TEXT DEFAULT 'ativo',
ADD COLUMN     "ultimaReativacaoSolicitada" TIMESTAMP(3),
DROP COLUMN "dataBatismo",
ADD COLUMN     "dataBatismo" TIMESTAMP(3),
DROP COLUMN "dataReconciliacao",
ADD COLUMN     "dataReconciliacao" TIMESTAMP(3);

-- CreateTable
CREATE TABLE "Aviso" (
    "id" SERIAL NOT NULL,
    "titulo" TEXT NOT NULL,
    "conteudo" TEXT NOT NULL,
    "imagem" TEXT,
    "unidadeId" INTEGER,
    "usuarioId" INTEGER NOT NULL,
    "dataCriacao" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dataAtualizacao" TIMESTAMP(3) NOT NULL,
    "ativo" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "Aviso_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Ministerio" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "responsavel" TEXT,
    "email" TEXT,
    "telefone" TEXT,
    "icone" TEXT,
    "criadoPor" INTEGER,
    "dataCriacao" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dataAtualizacao" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Ministerio_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PedidoOracao" (
    "id" SERIAL NOT NULL,
    "usuarioId" INTEGER,
    "nomeCompleto" TEXT,
    "telefone" TEXT,
    "email" TEXT,
    "tipoOracao" TEXT,
    "titulo" TEXT,
    "descricao" TEXT NOT NULL,
    "ehMembro" BOOLEAN NOT NULL DEFAULT false,
    "unidadeId" INTEGER,
    "status" TEXT DEFAULT 'pendente',
    "respondido" BOOLEAN NOT NULL DEFAULT false,
    "dataCriacao" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "PedidoOracao_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AcaoSocial" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "responsavel" TEXT,
    "email" TEXT,
    "telefone" TEXT,
    "diaSemana" TEXT,
    "horario" TEXT,
    "localRealizacao" TEXT,
    "icone" TEXT,
    "criadoPor" INTEGER,
    "dataCriacao" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dataAtualizacao" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AcaoSocial_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AvisoLeitura" (
    "id" SERIAL NOT NULL,
    "avisoId" INTEGER NOT NULL,
    "membroId" INTEGER NOT NULL,
    "dataLeitura" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AvisoLeitura_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AvisoUnidade" (
    "id" SERIAL NOT NULL,
    "avisoId" INTEGER NOT NULL,
    "unidadeId" INTEGER NOT NULL,

    CONSTRAINT "AvisoUnidade_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SolicitacaoReativacao" (
    "id" SERIAL NOT NULL,
    "membroId" INTEGER NOT NULL,
    "dataSolicitacao" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "ultimaSolicitacao" TIMESTAMP(3) NOT NULL,
    "contadorTentativas" INTEGER NOT NULL DEFAULT 1,
    "status" TEXT DEFAULT 'pendente',
    "observacoes" TEXT,

    CONSTRAINT "SolicitacaoReativacao_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Ministerio_nome_key" ON "Ministerio"("nome");

-- CreateIndex
CREATE UNIQUE INDEX "AcaoSocial_nome_key" ON "AcaoSocial"("nome");

-- CreateIndex
CREATE UNIQUE INDEX "Membro_email_key" ON "Membro"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Membro_cpf_key" ON "Membro"("cpf");
