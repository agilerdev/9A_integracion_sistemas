import { CocineroMSG } from '../common/constants';
import { CocineroDTO } from './dto/cocinero.dto';
import { Observable } from 'rxjs';
import { ClientProxySuperFlights } from '../common/proxy/client-proxy';
import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Post,
  Put,
} from '@nestjs/common';
import { ICocinero } from 'src/common/interfaces/cocinero.interface';
import { ApiTags } from '@nestjs/swagger';

@ApiTags('cocineros')
@Controller('api/v2/cocinero')
export class CocineroController {
  constructor(private readonly clientProxy: ClientProxySuperFlights) {}

  private _clientProxyCocinero = this.clientProxy.clientProxyCocineros();

  @Post()
  create(@Body() cocineroDTO: CocineroDTO): Observable<ICocinero> {
    return this._clientProxyCocinero.send(CocineroMSG.CREATE, cocineroDTO);
  }

  @Get()
  findAll(): Observable<ICocinero[]> {
    return this._clientProxyCocinero.send(CocineroMSG.FIND_ALL, '');
  }

  @Get(':id')
  findOne(@Param('id') id: string): Observable<ICocinero> {
    return this._clientProxyCocinero.send(CocineroMSG.FIND_ONE, id);
  }

  @Put(':id')
  update(
    @Param('id') id: string,
    @Body() cocineroDTO: CocineroDTO,
  ): Observable<ICocinero> {
    return this._clientProxyCocinero.send(CocineroMSG.UPDATE, {
      id,
      cocineroDTO,
    });
  }

  @Delete(':id')
  delete(@Param('id') id: string): Observable<any> {
    return this._clientProxyCocinero.send(CocineroMSG.DELETE, id);
  }
}
