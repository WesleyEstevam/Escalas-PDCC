import { PartialType } from '@nestjs/mapped-types';
import { CreateEscalaDto } from './create-escala.dto';
import { IsNumber, IsOptional, IsString } from 'class-validator';

export class UpdateEscalaDto extends PartialType(CreateEscalaDto) {
  @IsOptional()
  @IsNumber()
  id_coroinha?: number;

  @IsOptional()
  @IsNumber()
  id_objeto?: number;

  @IsOptional()
  @IsNumber()
  id_capela: number;

  @IsOptional()
  @IsString()
  horario_missa: string;

  @IsOptional()
  @IsString()
  tipo_cerimonia: string;

  @IsOptional()
  @IsString()
  data_escala: string;

  coroinhas?: { id_coroinha: number; id_objeto: number }[];
}
