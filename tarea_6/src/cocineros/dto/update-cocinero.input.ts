import { IsUUID } from 'class-validator';
import { CreateCocineroInput } from './create-cocinero.input';
import { InputType, Field, Int, PartialType, ID } from '@nestjs/graphql';

@InputType()
export class UpdateCocineroInput extends PartialType(CreateCocineroInput) {
  @Field(() => ID)
  @IsUUID()
  id: string;
}
