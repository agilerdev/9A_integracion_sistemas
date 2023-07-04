import { CocineroDTO } from './dto/cocinero.dto';
import { COCINERO } from '../common/models/models';
import { Injectable, HttpStatus } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { ICocinero } from 'src/common/interfaces/cocinero.interface';

@Injectable()
export class CocineroService {
  constructor(
    @InjectModel(COCINERO.name)
    private readonly model: Model<ICocinero>,
  ) {}

  async create(cocineroDTO: CocineroDTO): Promise<ICocinero> {
    const newCocinero = new this.model(cocineroDTO);
    return await newCocinero.save();
  }

  async findAll(): Promise<ICocinero[]> {
    return await this.model.find();
  }

  async findOne(id: string): Promise<ICocinero> {
    const cocinero = await this.model.findById(id);

    return cocinero;
  }

  async update(id: string, cocineroDTO: CocineroDTO): Promise<ICocinero> {
    return await this.model.findByIdAndUpdate(id, cocineroDTO, { new: true });
  }

  async delete(id: string) {
    await this.model.findByIdAndDelete(id);
    return {
      status: HttpStatus.OK,
      msg: 'Deleted',
    };
  }
}
