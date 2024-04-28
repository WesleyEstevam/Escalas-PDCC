import { Injectable } from '@nestjs/common';
import { CreateEscalaDto } from './dto/create-escala.dto';
import { UpdateEscalaDto } from './dto/update-escala.dto';
import { PrismaService } from 'src/conexao/PrismaService';

@Injectable()
export class EscalasService {
  constructor(private prisma: PrismaService) {}

  async create(createEscalaDto: CreateEscalaDto) {
    const { id_coroinha, id_horario, id_objeto } = createEscalaDto;

    const novaEscala = await this.prisma.escalas.create({
      data: {
        id_coroinha,
        id_horario,
        id_objeto,
      },
    });
    return novaEscala;
  }

  async verificarAltura(idCoroinha1: number, idCoroinha2: number) {
    const coroinha1 = await this.prisma.coroinhas.findUnique({
      where: { id_coroinha: idCoroinha1 },
    });

    const corinha2 = await this.prisma.coroinhas.findUnique({
      where: { id_coroinha: idCoroinha2 },
    });

    if (!coroinha1 || !corinha2) {
      throw new Error('Coroinha(s) não encontrado(s)');
    }

    const diferencaAltura = Math.abs(
      coroinha1.altura_coroinha - corinha2.altura_coroinha,
    );

    if (diferencaAltura > 20) {
      return {
        message:
          'Não é possível escalar os coroinhas! Muita diferença de altura',
      };
    } else {
      return { message: 'Escala criada com sucesso' };
    }
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
