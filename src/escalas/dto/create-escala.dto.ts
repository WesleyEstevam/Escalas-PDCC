import {
  IsString,
  IsInt,
  IsDateString,
  IsArray,
  ValidateNested,
  ArrayMinSize,
} from 'class-validator';
import { Type } from 'class-transformer';

class CoroinhaDto {
  @IsInt()
  id_coroinha: number;

  @IsInt()
  id_objeto: number;
}

export class CreateEscalaDto {
  @IsInt()
  id_capela: number;

  @IsString()
  horario_missa: string;

  @IsString()
  tipo_cerimonia: string;

  @IsDateString()
  data_escala: string;

  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => CoroinhaDto)
  @ArrayMinSize(1)
  coroinhas?: CoroinhaDto[];
}
