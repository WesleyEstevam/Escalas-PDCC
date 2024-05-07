import { IsEmpty, IsNumber, IsString } from 'class-validator';

export class CreateEscalaDto {
  @IsEmpty()
  @IsNumber()
  id_coroinha: number;

  @IsEmpty()
  @IsNumber()
  id_horario: number;

  @IsEmpty()
  @IsNumber()
  id_objeto: number;

  @IsEmpty()
  @IsString()
  data_escala: string;

  @IsEmpty()
  @IsString()
  horario_missa: string;

  @IsEmpty()
  @IsString()
  tipo_cerimonia: string;
}
