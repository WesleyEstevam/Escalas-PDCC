import { PartialType } from '@nestjs/mapped-types';
import { CreateEscalaDto } from './create-escala.dto';
import { IsNotEmpty, IsNumber, IsString } from 'class-validator';

export class UpdateEscalaDto extends PartialType(CreateEscalaDto) {
  @IsNumber()
  id_capela: number;

  @IsNumber()
  id_coroinha: number;

  @IsNumber()
  id_objeto: number;

  @IsNotEmpty()
  @IsString()
  horario_missa: string;

  @IsNotEmpty()
  @IsString()
  tipo_cerimonia: string;

  @IsNotEmpty()
  @IsString()
  data_escala: string;
}
