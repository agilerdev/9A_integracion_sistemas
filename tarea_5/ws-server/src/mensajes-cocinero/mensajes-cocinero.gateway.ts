import { WebSocketGateway, SubscribeMessage, MessageBody, OnGatewayConnection, OnGatewayDisconnect, WebSocketServer } from '@nestjs/websockets';
import { MensajesCocineroService } from './mensajes-cocinero.service';
import { CreateMensajesCocineroDto } from './dto/create-mensajes-cocinero.dto';
import { Server, Socket } from 'socket.io';
import { BadRequestException } from '@nestjs/common';

@WebSocketGateway({cors: true})
export class MensajesCocineroGateway  implements OnGatewayConnection, OnGatewayDisconnect {
  
  @WebSocketServer() wss: Server;
  
  constructor(private readonly mensajesCocineroService: MensajesCocineroService) {}
  listaDeUsuarios:string[]=['john','prueba'];
  async handleConnection(client: Socket) {
    const token= client.handshake.headers.authentication as string;
    let payload:string;
    try {
      if (!this.listaDeUsuarios.includes(token) )
      throw new BadRequestException('prueba');
      payload= token;
      await this.mensajesCocineroService.registerClient(client, payload);

    } catch (error) {
      client.disconnect();
      return;
    }

    this.wss.emit('clients-updated',this.mensajesCocineroService.getConnectedClients());

    
  }
  handleDisconnect(client: Socket) {
    this.mensajesCocineroService.removeClient(client.id)
    this.wss.emit('clients-updated',this.mensajesCocineroService.getConnectedClients());
  }
  @SubscribeMessage('message-from-client')
  onMessageFromClient(client: Socket, payload:CreateMensajesCocineroDto){
    this.wss.emit('message-from-server', {
      fullName:this.mensajesCocineroService.getStudentFullName(client.id),
      message:payload.message || 'nada'
    })

  }
}
