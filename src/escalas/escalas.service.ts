import { Injectable } from '@nestjs/common';
import { CreateEscalaDto } from './dto/create-escala.dto';
import { UpdateEscalaDto } from './dto/update-escala.dto';
import { PrismaService } from 'src/conexao/PrismaService';

@Injectable()
export class EscalasService {
  constructor(private prisma: PrismaService) {}

  create(createEscalaDto: CreateEscalaDto) {
    return 'This action adds a new escala';
  }

  findAll() {
    return this.prisma.escalas.findMany();
  }

  findOne(id: number) {
    return `This action returns a #${id} escala`;
  }

  update(id: number, updateEscalaDto: UpdateEscalaDto) {
    return `This action updates a #${id} escala`;
  }

  remove(id: number) {
    return `This action removes a #${id} escala`;
  }
}
