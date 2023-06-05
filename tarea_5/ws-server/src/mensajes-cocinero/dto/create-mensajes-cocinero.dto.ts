import { IsString, MinLength } from "class-validator";

export class CreateMensajesCocineroDto {
    @IsString()
    @MinLength(1)
    message: string;
}
