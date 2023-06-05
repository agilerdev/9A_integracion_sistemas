import { Module } from '@nestjs/common';
import { MensajesCocineroService } from './mensajes-cocinero.service';
import { MensajesCocineroGateway } from './mensajes-cocinero.gateway';
import { CocineroModule } from 'src/cocinero/cocinero.module';

@Module({
  providers: [MensajesCocineroGateway, MensajesCocineroService],
  imports:[CocineroModule]
})
export class MensajesCocineroModule {}
