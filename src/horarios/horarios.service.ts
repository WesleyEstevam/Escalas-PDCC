import { Injectable } from '@nestjs/common';
import { CreateHorarioDto } from './dto/create-horario.dto';
import { UpdateHorarioDto } from './dto/update-horario.dto';
import { PrismaService } from 'src/conexao/PrismaService';

@Injectable()
export class HorariosService {
  constructor(private prisma: PrismaService) {}

  async create(createHorarioDto: CreateHorarioDto) {
    const { nome_capela } = createHorarioDto;

    const novoHorario = await this.prisma.horarios_Missa.create({
      data: {
        nome_capela,
      },
    });

    return novoHorario;
  }

  findAll() {
    return this.prisma.horarios_Missa.findMany();
  }

  findOne(id: number) {
    return `This action returns a #${id} horario`;
  }

  update(id: number, updateHorarioDto: UpdateHorarioDto) {
    return `This action updates a #${id} horario`;
  }

  remove(id: number) {
    return `This action removes a #${id} horario`;
  }
}
