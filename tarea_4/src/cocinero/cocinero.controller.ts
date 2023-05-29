import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { CocineroService } from './cocinero.service';
import { CreateCocineroDto } from './dto/create-cocinero.dto';
import { UpdateCocineroDto } from './dto/update-cocinero.dto';

@Controller('cocinero')
export class CocineroController {
  constructor(private readonly cocineroService: CocineroService) {}

  @Post()
  create(@Body() createCocineroDto: CreateCocineroDto) {
    return this.cocineroService.create(createCocineroDto);
  }

  @Get()
  findAll() {
    return this.cocineroService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.cocineroService.findOne(id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateCocineroDto: UpdateCocineroDto) {
    return this.cocineroService.update(id, updateCocineroDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.cocineroService.remove(id);
  }
}
