import { Injectable } from '@nestjs/common';
import { CreateCoroinhaDto } from './dto/create-coroinha.dto';
import { UpdateCoroinhaDto } from './dto/update-coroinha.dto';
import { PrismaService } from 'src/conexao/PrismaService';

@Injectable()
export class CoroinhasService {
  constructor(private prisma: PrismaService) {}

  create(createCoroinhaDto: CreateCoroinhaDto) {
    const { nome_coroinha, sexo_coroinha, altura_coroinha } = createCoroinhaDto;

    const novoCoroinha = this.prisma.coroinhas.create({
      data: {
        nome_coroinha,
        sexo_coroinha,
        altura_coroinha,
      },
    });

    return novoCoroinha;
  }

  findAll() {
    return this.prisma.coroinhas.findMany();
  }

  findOne(id: number) {
    return `This action returns a #${id} coroinha`;
  }

  update(id: number, updateCoroinhaDto: UpdateCoroinhaDto) {
    return `This action updates a #${id} coroinha`;
  }

  remove(id: number) {
    return `This action removes a #${id} coroinha`;
  }
}
