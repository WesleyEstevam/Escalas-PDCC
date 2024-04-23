import { Module } from '@nestjs/common';
import { HorariosService } from './horarios.service';
import { HorariosController } from './horarios.controller';
import { PrismaService } from 'src/conexao/PrismaService';

@Module({
  controllers: [HorariosController],
  providers: [HorariosService, PrismaService],
})
export class HorariosModule {}
