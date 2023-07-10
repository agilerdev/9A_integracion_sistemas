import { ApiProperty } from '@nestjs/swagger';
import { IsEmail, IsNotEmpty, IsNumber, IsString } from 'class-validator';

export class StudentDTO {
  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  identificacion: string;
  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  nombre: string;
}
