import { Module } from '@nestjs/common';
import { EscalasService } from './escalas.service';
import { EscalasController } from './escalas.controller';
import { PrismaService } from 'src/conexao/PrismaService';

@Module({
  controllers: [EscalasController],
  providers: [EscalasService, PrismaService],
})
export class EscalasModule {}
