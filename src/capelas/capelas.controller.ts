import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { CapelasService } from './capelas.service';
import { CreateCapelasDto } from './dto/create-capelas.dto';
import { UpdateCapelasDto } from './dto/update-capelas.dto';

@Controller('capelas')
export class CapelasController {
  constructor(private readonly capelasService: CapelasService) {}

  @Post()
  create(@Body() createCapelasDto: CreateCapelasDto) {
    return this.capelasService.create(createCapelasDto);
  }

  @Get()
  findAll() {
    return this.capelasService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.capelasService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateCapelasDto: UpdateCapelasDto) {
    return this.capelasService.update(+id, updateCapelasDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.capelasService.remove(+id);
  }
}
