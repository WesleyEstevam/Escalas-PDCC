import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import * as cron from 'node-cron';
import axios from 'axios';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.enableCors();
  await app.listen(3001, () => {
    console.log('Server is running');
  });

  // Configurar o cron job para enviar requisições a cada 5 minutos
  cron.schedule('*/5 * * * *', async () => {
    try {
      await axios.get(process.env.DATABASE_URL); // ou URL pública da sua aplicação
      console.log('Ping successful');
    } catch (error) {
      console.error('Ping failed:', error.message);
    }
  });
}

bootstrap();
