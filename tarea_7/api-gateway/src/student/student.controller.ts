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
import { StudentMsg } from './../common/constants';
import { Observable } from 'rxjs';
import { StudentDTO } from './dto/student.dto';
import { ClientProxySuperFlights } from './../common/proxy/client-proxy';
import { IPaciente } from 'src/common/interfaces/student.interface';

@ApiTags('students')
// @UseGuards(JwtAuthGuard)
@Controller('api/v2/paciente')
export class StudentController {
  constructor(private readonly clientProxy: ClientProxySuperFlights) {}
  private _clientProxyStudent = this.clientProxy.clientProxyStudents();

  @Post()
  create(@Body() studentDTO: StudentDTO): Observable<IPaciente> {
    return this._clientProxyStudent.send(StudentMsg.CREATE, studentDTO);
  }

  @Get()
  findAll(): Observable<IPaciente[]> {
    return this._clientProxyStudent.send(StudentMsg.FIND_ALL, '');
  }

  @Get(':id')
  findOne(@Param('id') id: string): Observable<IPaciente> {
    return this._clientProxyStudent.send(StudentMsg.FIND_ONE, id);
  }

  @Put(':id')
  update(
    @Param('id') id: string,
    @Body() studentDTO: StudentDTO,
  ): Observable<IPaciente> {
    return this._clientProxyStudent.send(StudentMsg.UPDATE, { id, studentDTO });
  }

  @Delete(':id')
  delete(@Param('id') id: string): Observable<any> {
    return this._clientProxyStudent.send(StudentMsg.DELETE, id);
  }
}
