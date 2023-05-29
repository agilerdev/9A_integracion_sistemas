import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateCocineroDto } from './dto/create-cocinero.dto';
import { UpdateCocineroDto } from './dto/update-cocinero.dto';
import { Cocinero } from './entities/cocinero.entity';

@Injectable()
export class CocineroService {
  private cocineros: Cocinero[]=[
    {id:'1', nombre: 'Antonio Giler', sueldoBasico: 500, estado:true},
    {id:'2', nombre: 'Andres Macias', sueldoBasico: 500, estado:true}
  ]
  create(createCocineroDto: CreateCocineroDto) {
    const cocinero = new Cocinero();
    cocinero.id=  (Math.max( ...this.cocineros.map(elemento => parseInt(elemento.id)),0 )+1).toString() ;
    cocinero.nombre= createCocineroDto.nombre;
    cocinero.estado =true;
    this.cocineros.push(cocinero);
    return cocinero;
  }

  findAll() {
    return this.cocineros;
  }

  findOne(id: String) {
    const cocinero =  this.cocineros.find(cocinero=> cocinero.id===id);
    if (!cocinero) throw new NotFoundException(`ID ${id} not found`)
    return cocinero;
  }

  update(id: String, updateCocineroDto: UpdateCocineroDto) {
    const {nombre, sueldoBasico, estado} = updateCocineroDto;
    const cocinero = this.findOne(id);
    if (nombre) cocinero.nombre= nombre;
    if (sueldoBasico) cocinero.sueldoBasico= sueldoBasico;
    if (estado!= undefined) cocinero.estado= estado;
    this.cocineros =  this.cocineros.map( elemento=> {
      if (elemento.id===id) return cocinero;
      return elemento;
    } )

    return cocinero;
  }

  remove(id: String) {
    this.findOne(id);
    this.cocineros =  this.cocineros.filter(elemento=> elemento.id!== id);
  }
}
