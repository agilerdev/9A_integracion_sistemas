import { InputType, Float, Field } from "@nestjs/graphql";
import { IsNotEmpty, IsOptional, IsPositive } from "class-validator";

@InputType()
export class CreateCocineroInput {
  @Field(() => String)
  @IsNotEmpty()
  nombre: string;

  @Field(() => Float)
  @IsPositive()
  sueldoBasico: number;

  @Field(() => Boolean)
  @IsOptional()
  estado: boolean;
}
