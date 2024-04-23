import { IsString, IsEmpty } from 'class-validator';

export class CreateHorarioDto {
  @IsEmpty()
  @IsString()
  nome_capela: string;

  @IsEmpty()
  @IsString()
  horario_missa: string;

  @IsEmpty()
  @IsString()
  tipo_cerimonia: string;
}
