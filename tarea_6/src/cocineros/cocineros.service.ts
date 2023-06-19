import { Injectable, NotFoundException } from "@nestjs/common";
import { CreateCocineroInput } from "./dto/create-cocinero.input";
import { UpdateCocineroInput } from "./dto/update-cocinero.input";
import { Cocinero } from "./entities/cocinero.entity";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";

@Injectable()
export class CocinerosService {
  constructor(
    @InjectRepository(Cocinero)
    private readonly cocinerosRepository: Repository<Cocinero>
  ) {}
  async create(createCocineroInput: CreateCocineroInput): Promise<Cocinero> {
    const newCocinero = this.cocinerosRepository.create(createCocineroInput);
    return await this.cocinerosRepository.save(newCocinero);
  }

  async findAll(): Promise<Cocinero[]> {
    return this.cocinerosRepository.find();
  }

  async findOne(id: string): Promise<Cocinero> {
    const Cocinero = await this.cocinerosRepository.findOneBy({ id });
    if (!Cocinero) throw new NotFoundException(`Not found`);
    return Cocinero;
  }

  async update(
    id: string,
    updateCocineroInput: UpdateCocineroInput
  ): Promise<Cocinero> {
    const Cocinero = await this.cocinerosRepository.preload(
      updateCocineroInput
    );
    if (!Cocinero) throw new NotFoundException(`Not found`);
    return this.cocinerosRepository.save(Cocinero);
  }

  async remove(id: string): Promise<Cocinero> {
    const Cocinero = await this.findOne(id);
    Cocinero.estado = false;

    await this.cocinerosRepository.update(id, Cocinero);
    return Cocinero;
  }
}
