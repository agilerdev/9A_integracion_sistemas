import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { EstudianteModule } from './estudiante/estudiante.module';
import { CocineroModule } from './cocinero/cocinero.module';

@Module({
  imports: [EstudianteModule, CocineroModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
