import { IsString, IsNotEmpty, IsNumber } from "class-validator";
export class CreateCocineroDto {
    @IsString()
    @IsNotEmpty()
    nombre:string;

    @IsNumber()
    @IsNotEmpty()
    sueldoBasico:number;
}
