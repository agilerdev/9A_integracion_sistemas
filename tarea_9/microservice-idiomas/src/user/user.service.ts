import { IdiomaDTO } from './dto/user.dto';
import { HttpStatus, Injectable } from '@nestjs/common';
import * as bcrypt from 'bcrypt';
import { Model } from 'mongoose';
import { InjectModel } from '@nestjs/mongoose';
import { IDIOMA } from 'src/common/models/models';
import { IIdioma } from 'src/common/interfaces/user.interface';

@Injectable()
export class UserService {
  constructor(
    @InjectModel(IDIOMA.name) private readonly model: Model<IIdioma>,
  ) {}

  /* async checkPassword(password: string, passwordDB: string): Promise<boolean> {
    return await bcrypt.compare(password, passwordDB);
  } */

  async findByIdioma(descripcion: string) {
    return await this.model.findOne({ descripcion });
  }

  /* async hashPassword(password: string): Promise<string> {
    const salt = await bcrypt.genSalt(10);
    return await bcrypt.hash(password, salt);
  } */

  async create(idiomaDTO: IdiomaDTO): Promise<IIdioma> {
    /* const hash = await this.hashPassword(userDTO.password); */
    /* const newUser = new this.model({ ...userDTO, password: hash }); */
    const newIdioma = new this.model({ ...idiomaDTO });
    return await newIdioma.save();
  }

  /* async findAll(): Promise<IUser[]> {
    return await this.model.find();
  } */
  async findAll(): Promise<IIdioma[]> {
    return await this.model.find();
  }

  /* async findOne(id: string): Promise<IUser> {
    return await this.model.findById(id);
  } */
  async findOne(id: string): Promise<IIdioma> {
    return await this.model.findById(id);
  }

  /* async update(id: string, userDTO: UserDTO): Promise<IUser> {
    const hash = await this.hashPassword(userDTO.password);
    const user = { ...userDTO, password: hash };
    return await this.model.findByIdAndUpdate(id, user, { new: true });
  } */
  async update(id: string, idiomaDTO: IdiomaDTO): Promise<IIdioma> {
    /* const hash = await this.hashPassword(userDTO.password); */
    const idioma = { ...idiomaDTO };
    return await this.model.findByIdAndUpdate(id, idioma, { new: true });
  }

  /* async delete(id: string) {
    await this.model.findByIdAndDelete(id);
    return {
      status: HttpStatus.OK,
      msg: 'Deleted',
    };
  } */
  async delete(id: string) {
    await this.model.findByIdAndDelete(id);
    return {
      status: HttpStatus.OK,
      msg: 'Deleted',
    };
  }
}
