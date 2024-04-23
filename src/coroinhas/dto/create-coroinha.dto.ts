import { IsString, IsEmpty, IsNumber } from 'class-validator';
export class CreateCoroinhaDto {
  @IsEmpty()
  @IsString()
  nome_coroinha: string;

  @IsEmpty()
  @IsString()
  sexo_coroinha: string;

  @IsEmpty()
  @IsNumber()
  altura_coroinha: number;
}
