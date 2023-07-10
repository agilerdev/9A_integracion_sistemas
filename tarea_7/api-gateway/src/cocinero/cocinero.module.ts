import { ProxyModule } from '../common/proxy/proxy.module';
import { Module } from '@nestjs/common';
import { CocineroController } from './cocinero.controller';

@Module({
  imports: [ProxyModule],
  controllers: [CocineroController],
})
export class CocineroModule {}
