import { COCINERO } from '../common/models/models';
import { MongooseModule } from '@nestjs/mongoose';
import { Module } from '@nestjs/common';
import { CocineroController } from './cocinero.controller';
import { CocineroService } from './cocinero.service';
import { CocineroSchema } from './schema/cocinero.schema';

@Module({
  imports: [
    MongooseModule.forFeatureAsync([
      {
        name: COCINERO.name,
        useFactory: () =>
          // eslint-disable-next-line @typescript-eslint/no-var-requires
          CocineroSchema.plugin(require('mongoose-autopopulate')),
      },
    ]),
  ],
  controllers: [CocineroController],
  providers: [CocineroService],
})
export class CocineroModule {}
