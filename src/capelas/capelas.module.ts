import { Module } from '@nestjs/common';
import { CapelasService } from './capelas.service';
import { CapelasController } from './capelas.controller';
import { PrismaService } from 'src/conexao/PrismaService';

@Module({
  controllers: [CapelasController],
  providers: [CapelasService, PrismaService],
})
export class CapelasModule {}
