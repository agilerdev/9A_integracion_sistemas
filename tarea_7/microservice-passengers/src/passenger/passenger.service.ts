import { Injectable, HttpStatus } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { IPrestamista } from 'src/common/interfaces/passenger.interface';
import { PRESTAMISTA } from 'src/common/models/models';
import { PrestamistaDTO } from './dto/passenger.dto';

@Injectable()
export class PrestamistaService {
  constructor(
    @InjectModel(PRESTAMISTA.name) private readonly model: Model<IPrestamista>,
  ) {}

  async create(prestamistaDTO: PrestamistaDTO): Promise<IPrestamista> {
    const newPrestamista = new this.model(prestamistaDTO);
    return await newPrestamista.save();
  }

  async findAll(): Promise<IPrestamista[]> {
    return await this.model.find();
  }

  async findOne(id: string): Promise<IPrestamista> {
    return await this.model.findById(id);
  }

  async update(
    id: string,
    passengerDTO: PrestamistaDTO,
  ): Promise<IPrestamista> {
    return await this.model.findByIdAndUpdate(id, passengerDTO, { new: true });
  }

  async delete(id: string) {
    await this.model.findByIdAndDelete(id);
    return {
      status: HttpStatus.OK,
      msg: 'Deleted',
    };
  }
}
