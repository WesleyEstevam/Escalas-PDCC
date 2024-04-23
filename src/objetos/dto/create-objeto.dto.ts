import { IsString, IsEmpty } from 'class-validator';

export class CreateObjetoDto {
  @IsEmpty()
  @IsString()
  nome_objeto: string;
}
