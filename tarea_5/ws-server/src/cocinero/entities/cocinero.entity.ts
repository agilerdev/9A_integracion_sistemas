import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";
@Entity()
export class Cocinero {
    @PrimaryGeneratedColumn('uuid')
    id:string;
    
    @Column('varchar',{
        unique:true
    })
    nombre:string;

    @Column('float')
    sueldoBasico: number;

    @Column('boolean', {default:true})
    estado:boolean;
}
