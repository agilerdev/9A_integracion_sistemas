import { Module } from '@nestjs/common';
import { UserService } from './user.service';
import { IdiomaSchema } from './schema/user.schema';
import { IDIOMA } from 'src/common/models/models';
import { MongooseModule } from '@nestjs/mongoose';
import { UserController } from './user.controller';

@Module({
  imports: [
    MongooseModule.forFeatureAsync([
      {
        name: IDIOMA.name,
        useFactory: () => IdiomaSchema,
      },
    ]),
  ],
  controllers: [UserController],
  providers: [UserService],
})
export class UserModule {}
