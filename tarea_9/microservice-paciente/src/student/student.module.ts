import { Module } from '@nestjs/common';
import { StudentService } from './student.service';
import { PacienteSchema } from './schema/student.schema';
import { PACIENTE } from 'src/common/models/models';
import { MongooseModule } from '@nestjs/mongoose';
import { StudentController } from './student.controller';

@Module({
  imports: [
    MongooseModule.forFeatureAsync([
      {
        name: PACIENTE.name,
        useFactory: () => PacienteSchema,
      },
    ]),
  ],
  controllers: [StudentController],
  providers: [StudentService],
})
export class StudentModule {}
