import { Injectable } from '@nestjs/common';
import {Socket} from 'socket.io'
import { Cocinero } from '../cocinero/entities/cocinero.entity'
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
import { } from 'src/cocinero/entities/cocinero.entity';
import { CocineroService } from 'src/cocinero/cocinero.service';

interface ConnectedClients {
  [id:string]: {
     socket: Socket,
     cocinero: Cocinero,
  }
}
@Injectable()
export class MensajesCocineroService {
 private connectedClients: ConnectedClients={}

 constructor( @InjectRepository(Cocinero)
  private readonly cocineroRepository: Repository<Cocinero>,
  private readonly cocineroService: CocineroService
   ){}

 async registerClient(client:Socket, name: string){
     console.log(this.cocineroService.prueba());
     const cocinero =await  this.cocineroRepository.findOneBy({ nombre: name });
     if (!cocinero) throw new Error('Cocinero no encontrado');
     if (!cocinero.estado) throw new Error('No activo');

     
     this.connectedClients[client.id]= {socket:client, cocinero: cocinero};
 }
 removeClient(clientId:string){
     delete this.connectedClients[clientId];
 }
 getConnectedClients():string[]{
     // return Object.keys(this.connectedClients).length;
     // console.log(this.connectedClients)
      return Object.keys(this.connectedClients);
 }
 getStudentFullName(id:string){
     return this.connectedClients[id].cocinero.nombre;
 }
}
