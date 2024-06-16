import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateCoroinhaDto } from './dto/create-coroinha.dto';
import { UpdateCoroinhaDto } from './dto/update-coroinha.dto';
import { PrismaService } from 'src/conexao/PrismaService';

@Injectable()
export class CoroinhasService {
  constructor(private prisma: PrismaService) {}

  create(createCoroinhaDto: CreateCoroinhaDto) {
    const { nome_coroinha, sexo_coroinha, altura_coroinha, tipo_coroinha } =
      createCoroinhaDto;

    const novoCoroinha = this.prisma.coroinha.create({
      data: {
        nome_coroinha,
        sexo_coroinha,
        altura_coroinha,
        tipo_coroinha,
      },
    });

    return novoCoroinha;
  }

  async findOne(id_coroinha: number) {
    return this.prisma.coroinha.findUnique({
      where: { id_coroinha },
    });
  }

  async toggleDispensa(id_coroinha: number) {
    const coroinha = await this.findOne(id_coroinha);
    if (!coroinha) {
      throw new NotFoundException('Coroinha não encontrado');
    }
    const newStatus = coroinha.status === 'ativo' ? 'dispensado' : 'ativo';
    const updatedCoroinha = await this.prisma.coroinha.update({
      where: { id_coroinha },
      data: { status: newStatus },
    });
    return updatedCoroinha;
  }

  async findAllActive() {
    return this.prisma.coroinha.findMany({
      where: {
        status: 'ativo',
      },
    });
  }

  async filterName(nome_coroinha: string) {
    return this.prisma.coroinha.findFirst({
      where: {
        nome_coroinha: {
          contains: nome_coroinha,
          mode: 'insensitive',
        },
      },
    });
  }

  async findAll() {
    return this.prisma.coroinha.findMany();
  }

  async update(id: number, updateCoroinhaDto: UpdateCoroinhaDto) {
    const { nome_coroinha, sexo_coroinha, altura_coroinha, tipo_coroinha } =
      updateCoroinhaDto;

    const atualizarCoroinha = await this.prisma.coroinha.update({
      where: { id_coroinha: id },
      data: {
        nome_coroinha,
        sexo_coroinha,
        altura_coroinha,
        tipo_coroinha,
      },
    });
    return atualizarCoroinha;
  }

  async remove(id: number) {
    return await this.prisma.coroinha.delete({
      where: {
        id_coroinha: id,
      },
    });
  }
}
