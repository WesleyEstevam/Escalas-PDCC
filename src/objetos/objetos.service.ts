import { Injectable } from '@nestjs/common';
import { CreateObjetoDto } from './dto/create-objeto.dto';
import { UpdateObjetoDto } from './dto/update-objeto.dto';
import { PrismaService } from 'src/conexao/PrismaService';

@Injectable()
export class ObjetosService {
  constructor(private prisma: PrismaService) {}

  create(createObjetoDto: CreateObjetoDto) {
    const { nome_objeto } = createObjetoDto;

    const novoObjeto = this.prisma.objetos_Liturgicos.create({
      data: {
        nome_objeto,
      },
    });
    return novoObjeto;
  }

  findAll() {
    return this.prisma.objetos_Liturgicos.findMany();
  }

  findOne(id: number) {
    return `This action returns a #${id} objeto`;
  }

  update(id: number, updateObjetoDto: UpdateObjetoDto) {
    return `This action updates a #${id} objeto`;
  }

  remove(id: number) {
    return `This action removes a #${id} objeto`;
  }
}
