import { MessagePattern, Payload } from '@nestjs/microservices';
import { CocineroDTO } from './dto/cocinero.dto';
import { CocineroService } from './cocinero.service';
import { Controller } from '@nestjs/common';
import { CocineroMSG } from 'src/common/constants';

@Controller()
export class CocineroController {
  constructor(private readonly cocineroService: CocineroService) {}

  @MessagePattern(CocineroMSG.CREATE)
  create(@Payload() cocineroDTO: CocineroDTO) {
    return this.cocineroService.create(cocineroDTO);
  }

  @MessagePattern(CocineroMSG.FIND_ALL)
  findAll() {
    return this.cocineroService.findAll();
  }

  @MessagePattern(CocineroMSG.FIND_ONE)
  findOne(@Payload() id: string) {
    return this.cocineroService.findOne(id);
  }

  @MessagePattern(CocineroMSG.UPDATE)
  update(@Payload() payload) {
    return this.cocineroService.update(payload.id, payload.cocineroDTO);
  }

  @MessagePattern(CocineroMSG.DELETE)
  delete(@Payload() id: string) {
    return this.cocineroService.delete(id);
  }
}
