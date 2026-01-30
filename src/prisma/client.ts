// Este arquivo será usado para inicializar e exportar a instância do Prisma Client
import 'dotenv/config';
import { PrismaClient } from '@prisma/client';



// Remove o prefixo 'prisma+' e aspas extras




const rawUrl = process.env.DATABASE_URL || '';
const accelerateUrl = rawUrl.startsWith('prisma+')
	? rawUrl.replace(/^prisma\+/, '')
	: rawUrl;


console.log('Accelerate URL:', accelerateUrl);

const prisma = accelerateUrl && accelerateUrl.length > 20
	? new PrismaClient({ accelerateUrl })
	: new PrismaClient();

export default prisma;
