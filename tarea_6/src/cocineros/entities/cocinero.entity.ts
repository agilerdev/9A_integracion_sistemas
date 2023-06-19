import { ObjectType, Field, Int, ID, Float } from '@nestjs/graphql';
import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity({name:'cocineros'})
@ObjectType()
export class Cocinero {
  
  @PrimaryGeneratedColumn('uuid')
    @Field(()=> ID)
    id:string;
    

    @Column()
    @Field(()=>String)
    nombre:string;

    @Column()
    @Field(()=> Float)
    sueldoBasico: number;

    @Column()
    @Field(()=>Boolean)
    estado:boolean;
}
