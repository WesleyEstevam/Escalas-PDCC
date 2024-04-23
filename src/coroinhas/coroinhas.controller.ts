import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
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