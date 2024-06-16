import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  NotFoundException,
} from '@nestjs/common';
import { CoroinhasService } from './coroinhas.service';
import { CreateCoroinhaDto } from './dto/create-coroinha.dto';
import { UpdateCoroinhaDto } from './dto/update-coroinha.dto';

@Controller('coroinhas')
export class CoroinhasController {
  constructor(private readonly coroinhasService: CoroinhasService) {}

  @Post()
  create(@Body() createCoroinhaDto: CreateCoroinhaDto) {
    return this.coroinhasService.create(createCoroinhaDto);
  }

  @Patch(':id_coroinha/dispensar')
  async dispensarCoroinha(@Param('id_coroinha') id_coroinha: number) {
    return this.coroinhasService.toggleDispensa(Number(id_coroinha));
  }

  @Get('nome/:nome_coroinha')
  async filterName(@Param('nome_coroinha') nome_coroinha: string) {
    const coroinha = await this.coroinhasService.filterName(nome_coroinha);
    if (!coroinha) {
      throw new NotFoundException(
        `Coroinha com nome ${nome_coroinha} não encontrado`,
      );
    }
    return coroinha;
  }

  @Get('ativos')
  findAllActive() {
    return this.coroinhasService.findAllActive();
  }

  @Get()
  findAll() {
    return this.coroinhasService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.coroinhasService.findOne(+id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateCoroinhaDto: UpdateCoroinhaDto,
  ) {
    return this.coroinhasService.update(+id, updateCoroinhaDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.coroinhasService.remove(+id);
  }
}
