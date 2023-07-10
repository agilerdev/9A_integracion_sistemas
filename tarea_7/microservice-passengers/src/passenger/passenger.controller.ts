import { PrestamistaMSG } from './../common/constants';
import { MessagePattern, Payload } from '@nestjs/microservices';
import { Body, Controller } from '@nestjs/common';
import { PrestamistaService } from './passenger.service';
import { PrestamistaDTO } from './dto/passenger.dto';

@Controller()
export class PrestamistaController {
  constructor(private readonly prestamistaService: PrestamistaService) {}

  @MessagePattern(PrestamistaMSG.CREATE)
  create(@Body() prestamistaDTO: PrestamistaDTO) {
    return this.prestamistaService.create(prestamistaDTO);
  }

  @MessagePattern(PrestamistaMSG.FIND_ALL)
  findAll() {
    return this.prestamistaService.findAll();
  }

  @MessagePattern(PrestamistaMSG.FIND_ONE)
  findOne(@Payload() id: string) {
    return this.prestamistaService.findOne(id);
  }

  @MessagePattern(PrestamistaMSG.UPDATE)
  update(@Payload() payload) {
    return this.prestamistaService.update(payload.id, payload.prestamistaDTO);
  }

  @MessagePattern(PrestamistaMSG.DELETE)
  delete(@Payload() id: string) {
    return this.prestamistaService.delete(id);
  }
}
