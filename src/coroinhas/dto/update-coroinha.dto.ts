import { PartialType } from '@nestjs/mapped-types';
import { CreateCoroinhaDto } from './create-coroinha.dto';

export class UpdateCoroinhaDto extends PartialType(CreateCoroinhaDto) {
  nome_coroinha?: string;

  sexo_coroinha?: string;

  altura_coroinha?: number;

  tipo_coroinha?: string;
}
