import { Module } from '@nestjs/common';
import { CocineroService } from './cocinero.service';
import { CocineroController } from './cocinero.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Cocinero } from './entities/cocinero.entity';

@Module({
  controllers: [CocineroController],
  providers: [CocineroService],
  imports:[ TypeOrmModule.forFeature([
    Cocinero
  ]) ],
  exports:[ CocineroService, TypeOrmModule ]
})
export class CocineroModule {}
