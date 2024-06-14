import {
  Controller,
  Get,
  Post,
  Body,
  Param,
  Delete,
  Patch,
  Query,
  BadRequestException,
} from '@nestjs/common';
import { EscalasService } from './escalas.service';
import { CreateEscalaDto } from './dto/create-escala.dto';
import { UpdateEscalaDto } from './dto/update-escala.dto';

@Controller('escalas')
export class EscalasController {
  constructor(private readonly escalasService: EscalasService) {}

  @Post()
  create(@Body() createEscalaDto: CreateEscalaDto) {
    return this.escalasService.create(createEscalaDto);
  }
  @Get('verificarAltura')
  async verificarAltura(
    @Query('idCoroinha1') idCoroinha1: string,
    @Query('idCoroinha2') idCoroinha2: string,
  ) {
    const coroinha1 = parseInt(idCoroinha1, 10);
    const coroinha2 = parseInt(idCoroinha2, 10);

    if (isNaN(coroinha1) || isNaN(coroinha2)) {
      throw new BadRequestException('IDs inválidos fornecidos');
    }

    return this.escalasService.verificarAltura(coroinha1, coroinha2);
  }

  @Get()
  findAll() {
    return this.escalasService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.escalasService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateEscalaDto: UpdateEscalaDto) {
    return this.escalasService.update(+id, updateEscalaDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.escalasService.remove(+id);
  }
}
