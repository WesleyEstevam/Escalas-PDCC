import { Module } from '@nestjs/common';
import { ObjetosService } from './objetos.service';
import { ObjetosController } from './objetos.controller';
import { PrismaService } from 'src/conexao/PrismaService';

@Module({
  controllers: [ObjetosController],
  providers: [ObjetosService, PrismaService],
})
export class ObjetosModule {}
