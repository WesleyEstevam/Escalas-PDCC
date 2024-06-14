import { Injectable } from '@nestjs/common';
import { CreateEscalaDto } from './dto/create-escala.dto';
import { UpdateEscalaDto } from './dto/update-escala.dto';
import { PrismaService } from 'src/conexao/PrismaService';

@Injectable()
export class EscalasService {
  constructor(private prisma: PrismaService) {}

  async create(createEscalaDto: CreateEscalaDto) {
    const { id_capela, horario_missa, tipo_cerimonia, data_escala, coroinhas } =
      createEscalaDto;

    const escala = await this.prisma.escala.create({
      data: {
        id_capela,
        horario_missa,
        tipo_cerimonia,
        data_escala: new Date(data_escala),
        coroinhas: {
          create: coroinhas.map((coroinha) => ({
            id_coroinha: coroinha.id_coroinha,
            id_objeto: coroinha.id_objeto,
          })),
        },
      },
      include: {
        coroinhas: true,
      },
    });

    return escala;
  }

  async verificarAltura(idCoroinha1: number, idCoroinha2: number) {
    const coroinha1 = await this.prisma.coroinha.findUnique({
      where: { id_coroinha: idCoroinha1 },
      include: { escalasCoroinhas: { include: { objetoLiturgico: true } } },
    });

    const coroinha2 = await this.prisma.coroinha.findUnique({
      where: { id_coroinha: idCoroinha2 },
      include: { escalasCoroinhas: { include: { objetoLiturgico: true } } },
    });

    if (!coroinha1 || !coroinha2) {
      throw new Error('Coroinha(s) não encontrado(s)');
    }

    const objetosLiturgicosEspecificos = [4, 5, 6]; // IDs dos objetos litúrgicos específicos

    const objeto1 = coroinha1.escalasCoroinhas
      .map((ec) => ec.objetoLiturgico.id_objeto)
      .find((id) => objetosLiturgicosEspecificos.includes(id));
    const objeto2 = coroinha2.escalasCoroinhas
      .map((ec) => ec.objetoLiturgico.id_objeto)
      .find((id) => objetosLiturgicosEspecificos.includes(id));

    if (!objeto1 || !objeto2) {
      return {
        message:
          'Os coroinhas não estão associados aos objetos litúrgicos necessários para verificação de altura',
      };
    }

    const diferencaAltura = Math.abs(
      (coroinha1.altura_coroinha || 0) - (coroinha2.altura_coroinha || 0),
    );

    if (diferencaAltura > 0.2) {
      // Diferenca de 20 cm
      return {
        message:
          'Não é possível escalar os coroinhas! Muita diferença de altura',
      };
    } else {
      return { message: 'Escala criada com sucesso' };
    }
  }

  findAll() {
    return this.prisma.escala.findMany({
      select: {
        id_escala: true,
        data_escala: true,
        horario_missa: true,
        tipo_cerimonia: true,
        coroinhas: {
          select: {
            coroinha: {
              select: {
                nome_coroinha: true,
              },
            },
            objetoLiturgico: {
              select: {
                nome_objeto: true,
              },
            },
          },
        },
        capela: {
          select: {
            nome_capela: true,
          },
        },
      },
    });
  }

  async findOne(id: number) {
    return await this.prisma.escala.findUnique({
      where: {
        id_escala: id,
      },
      select: {
        id_escala: true,
        data_escala: true,
        horario_missa: true,
        tipo_cerimonia: true,
        coroinhas: {
          select: {
            coroinha: {
              select: {
                nome_coroinha: true,
              },
            },
            objetoLiturgico: {
              select: {
                nome_objeto: true,
              },
            },
          },
        },
        capela: {
          select: {
            nome_capela: true,
          },
        },
      },
    });
  }

  async update(id: number, updateEscalaDto: UpdateEscalaDto) {
    const { id_capela, horario_missa, tipo_cerimonia, data_escala, coroinhas } =
      updateEscalaDto;

    // Cria o objeto dataToUpdate com os campos que não são opcionais
    const dataToUpdate: any = {
      id_capela,
      horario_missa,
      tipo_cerimonia,
      data_escala,
    };

    if (coroinhas && coroinhas.length > 0) {
      dataToUpdate.coroinhas = {
        create: coroinhas.map(({ id_coroinha, id_objeto }) => ({
          id_coroinha,
          id_objeto,
        })),
      };
    } else {
      return dataToUpdate;
    }

    const updatedEscala = await this.prisma.escala.update({
      where: {
        id_escala: id,
      },
      data: dataToUpdate,
      include: {
        coroinhas: true,
      },
    });

    return updatedEscala;
  }

  async remove(id: number) {
    return await this.prisma.escala.delete({
      where: {
        id_escala: id,
      },
    });
  }
}
