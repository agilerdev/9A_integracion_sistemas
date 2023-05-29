import { Module } from '@nestjs/common';
import { CocineroService } from './cocinero.service';
import { CocineroController } from './cocinero.controller';

@Module({
  controllers: [CocineroController],
  providers: [CocineroService]
})
export class CocineroModule {}
