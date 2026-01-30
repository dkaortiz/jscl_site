"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
// Este arquivo será usado para inicializar e exportar a instância do Prisma Client
const client_1 = require("@prisma/client");
const prisma = new client_1.PrismaClient();
exports.default = prisma;
