import { IsNotEmpty, IsNumber, IsString } from 'class-validator';

export class CreateEscalaDto {
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

  @IsString()
  data_escala: string;
}
