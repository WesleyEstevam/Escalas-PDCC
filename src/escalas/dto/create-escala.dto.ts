import { IsEmpty, IsNumber } from 'class-validator';

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
}
