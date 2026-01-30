# JSCL Node.js + Prisma

Projeto Node.js para migração do sistema JSCL (PHP) para uma stack moderna com Express, TypeScript e Prisma.

## Estrutura Inicial
- src/
  - controllers/
  - routes/
  - services/
  - middlewares/
  - prisma/
- .env
- package.json
- tsconfig.json
- README.md

## Objetivo
Migrar todas as páginas e funções do sistema JSCL para Node.js + Prisma, mantendo a lógica de negócio e integridade dos dados.

## Como rodar
1. Instale as dependências: `npm install`
2. Configure o banco de dados no arquivo `.env`
3. Rode as migrações Prisma: `npx prisma migrate dev`
4. Inicie o servidor: `npm run dev`

---

Este README será atualizado conforme a migração avança.