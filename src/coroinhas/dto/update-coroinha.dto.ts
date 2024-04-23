import { PartialType } from '@nestjs/mapped-types';
import { CreateCoroinhaDto } from './create-coroinha.dto';

export class UpdateCoroinhaDto extends PartialType(CreateCoroinhaDto) {}
