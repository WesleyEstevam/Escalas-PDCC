import { PartialType } from '@nestjs/mapped-types';
import { CreateCapelasDto } from './create-capelas.dto';

export class UpdateCapelasDto extends PartialType(CreateCapelasDto) {}
