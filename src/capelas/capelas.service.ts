import { Injectable } from '@nestjs/common';
import { CreateCapelasDto } from './dto/create-capelas.dto';
import { UpdateCapelasDto } from './dto/update-capelas.dto';
import { PrismaService } from 'src/conexao/PrismaService';

@Injectable()
export class CapelasService {
  constructor(private prisma: PrismaService) {}

  async create(createCapelasDto: CreateCapelasDto) {
    const { nome_capela } = createCapelasDto;

    const novaCapela = await this.prisma.capelas.create({
      data: {
        nome_capela,
      },
    });

    return novaCapela;
  }

  findAll() {
    return this.prisma.capelas.findMany();
  }

  findOne(id: number) {
    return `This action returns a #${id} horario`;
  }

  update(id: number, updateCapelasDto: UpdateCapelasDto) {
    return `This action updates a #${id} horario`;
  }

  remove(id: number) {
    return `This action removes a #${id} horario`;
  }
}
