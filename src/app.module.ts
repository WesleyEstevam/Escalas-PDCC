import { Module } from '@nestjs/common';
import { CapelasModule } from './capelas/capelas.module';
import { PrismaService } from './conexao/PrismaService';
import { CoroinhasModule } from './coroinhas/coroinhas.module';
import { ObjetosModule } from './objetos/objetos.module';
import { EscalasModule } from './escalas/escalas.module';

@Module({
  imports: [CapelasModule, CoroinhasModule, ObjetosModule, EscalasModule],
  controllers: [],
  providers: [PrismaService],
})
export class AppModule {}
