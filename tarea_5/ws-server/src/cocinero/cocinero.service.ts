import { BadRequestException, Injectable, InternalServerErrorException, Logger, NotFoundException } from '@nestjs/common';
import { CreateCocineroDto } from './dto/create-cocinero.dto';
import { UpdateCocineroDto } from './dto/update-cocinero.dto';
import { Repository } from 'typeorm/repository/Repository';
import { Cocinero } from './entities/cocinero.entity';
import { InjectRepository } from '@nestjs/typeorm';

@Injectable()
export class CocineroService {
  private readonly logger = new Logger('CocineroServide');
  constructor( 
    @InjectRepository(Cocinero) 
    private readonly cocineroRepository: Repository<Cocinero>,

    ){}
  async create(createCocineroDto: CreateCocineroDto) {
    try {
      console.log(createCocineroDto);
      const cocinero =  this.cocineroRepository.create(createCocineroDto);
      await this.cocineroRepository.save(cocinero);
      return cocinero;
    } catch (error) {
      console.log(error)
      if (error.code==='23505')
        throw new BadRequestException(error.detail)
      this.logger.error(error);
      throw new InternalServerErrorException('Error no esperado')
    }
  }

  findAll() {
    return this.cocineroRepository.find();
  }

  async findOne(id: string) {
    const cocinero= await  this.cocineroRepository.findOneBy ({ id });
    if (!cocinero)
      throw new NotFoundException(`cocinero ${id} no encontrado`);
    return cocinero;

  }

  async update(id: string, updateCocineroDto: UpdateCocineroDto) {
    const cocinero = await this.cocineroRepository.preload({
      id: id,
      ...updateCocineroDto
    });
    if (!cocinero) throw new NotFoundException(`cocinero ${id} no encontrado`)

    try {
      await  this.cocineroRepository.save(cocinero)
      return cocinero;
      
    } catch (error) {
      console.log(error)
    }

  }

  async remove(id: string) {
    const cocinero = await this.findOne(id);
    await this.cocineroRepository.remove(cocinero);

  }
  prueba():String[]{
    return ['uno','dos','tres'];
  }
}
