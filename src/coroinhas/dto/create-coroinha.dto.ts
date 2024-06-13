import { IsString, IsEmpty, IsNumber, IsNotEmpty } from 'class-validator';
export class CreateCoroinhaDto {
  @IsNotEmpty()
  @IsString()
  nome_coroinha: string;

  @IsNotEmpty()
  @IsString()
  sexo_coroinha: string;

  @IsEmpty()
  @IsNumber()
  altura_coroinha: number;

  @IsNotEmpty()
  @IsNumber()
  tipo_coroinha: string;
}
