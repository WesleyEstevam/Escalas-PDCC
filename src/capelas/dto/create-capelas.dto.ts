import { IsString, IsEmpty } from 'class-validator';

export class CreateCapelasDto {
  @IsEmpty()
  @IsString()
  nome_capela: string;
}
