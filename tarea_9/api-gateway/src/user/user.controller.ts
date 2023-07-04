import { ApiTags } from '@nestjs/swagger';
import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Post,
  Put,
} from '@nestjs/common';
import { UserMsg } from './../common/constants';
import { Observable } from 'rxjs';
import { UserDTO } from './dto/user.dto';
import { ClientProxySuperFlights } from './../common/proxy/client-proxy';
import { IIdioma } from 'src/common/interfaces/user.interface';

@ApiTags('users')
@Controller('api/v2/idioma')
export class UserController {
  constructor(private readonly clientProxy: ClientProxySuperFlights) {}
  private _clientProxyUser = this.clientProxy.clientProxyUsers();

  @Post()
  create(@Body() userDTO: UserDTO): Observable<IIdioma> {
    return this._clientProxyUser.send(UserMsg.CREATE, userDTO);
  }

  @Get()
  findAll(): Observable<IIdioma[]> {
    return this._clientProxyUser.send(UserMsg.FIND_ALL, '');
  }

  @Get(':id')
  findOne(@Param('id') id: string): Observable<IIdioma> {
    return this._clientProxyUser.send(UserMsg.FIND_ONE, id);
  }

  @Put(':id')
  update(
    @Param('id') id: string,
    @Body() userDTO: UserDTO,
  ): Observable<IIdioma> {
    return this._clientProxyUser.send(UserMsg.UPDATE, { id, userDTO });
  }

  @Delete(':id')
  delete(@Param('id') id: string): Observable<any> {
    return this._clientProxyUser.send(UserMsg.DELETE, id);
  }
}
