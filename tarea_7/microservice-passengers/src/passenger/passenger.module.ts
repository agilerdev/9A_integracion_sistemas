import { Module } from '@nestjs/common';
import { PRESTAMISTA } from './../common/models/models';
import { MongooseModule } from '@nestjs/mongoose';
import { PrestamistaController } from './passenger.controller';
import { PrestamistaService } from './passenger.service';
import { PrestamistaSchema } from './schema/passenger.schema';

@Module({
  imports: [
    MongooseModule.forFeatureAsync([
      {
        name: PRESTAMISTA.name,
        useFactory: () => PrestamistaSchema,
      },
    ]),
  ],
  controllers: [PrestamistaController],
  providers: [PrestamistaService],
})
export class PrestamistaModule {}
