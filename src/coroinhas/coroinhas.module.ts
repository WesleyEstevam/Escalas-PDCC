import { Module } from '@nestjs/common';
import { CoroinhasService } from './coroinhas.service';
import { CoroinhasController } from './coroinhas.controller';
import { PrismaService } from 'src/conexao/PrismaService';

@Module({
  controllers: [CoroinhasController],
  providers: [CoroinhasService, PrismaService],
})
export class CoroinhasModule {}
