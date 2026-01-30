"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const dotenv_1 = __importDefault(require("dotenv"));
// Inicializa variáveis de ambiente
dotenv_1.default.config();
const app = (0, express_1.default)();
app.use(express_1.default.json());
// Rotas placeholder
app.get('/', (req, res) => {
    res.send('API JSCL Node.js + Prisma');
});
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Servidor rodando na porta ${PORT}`);
});
