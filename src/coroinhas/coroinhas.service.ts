import { Injectable } from '@nestjs/common';
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

  findAll() {
    return this.prisma.coroinha.findMany();
  }

  findOne(id: number) {
    return this.prisma.coroinha.findUnique({
      where: {
        id_coroinha: id,
      },
    });
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
