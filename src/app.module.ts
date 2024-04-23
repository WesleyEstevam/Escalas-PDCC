import { Module } from '@nestjs/common';
import { HorariosModule } from './horarios/horarios.module';
import { PrismaService } from './conexao/PrismaService';

@Module({
  imports: [HorariosModule],
  controllers: [],
  providers: [PrismaService],
})
export class AppModule {}
