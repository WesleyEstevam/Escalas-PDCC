import { Injectable } from '@nestjs/common';
import { CreateEscalaDto } from './dto/create-escala.dto';
import { UpdateEscalaDto } from './dto/update-escala.dto';
import { PrismaService } from 'src/conexao/PrismaService';

@Injectable()
export class EscalasService {
  constructor(private prisma: PrismaService) {}

  create(createEscalaDto: CreateEscalaDto) {
    const { id_coroinha, id_horario, id_objeto } = createEscalaDto;

    const novaEscala = this.prisma.escalas.create({
      data: {
        id_coroinha,
        id_horario,
        id_objeto,
      },
    });
    return novaEscala;
  }

  findAll() {
    return this.prisma.escalas.findMany({
      select: {
        id_escala: true,
        coroinhas: {
          select: {
            nome_coroinha: true,
          },
        },
        horarios_missa: {
          select: {
            nome_capela: true,
            horario_missa: true,
          },
        },
        nome_objeto: {
          select: {
            nome_objeto: true,
          },
        },
      },
    });
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
