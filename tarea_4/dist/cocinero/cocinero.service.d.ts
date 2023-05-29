import { CreateCocineroDto } from './dto/create-cocinero.dto';
import { UpdateCocineroDto } from './dto/update-cocinero.dto';
import { Cocinero } from './entities/cocinero.entity';
export declare class CocineroService {
    private cocineros;
    create(createCocineroDto: CreateCocineroDto): Cocinero;
    findAll(): Cocinero[];
    findOne(id: String): Cocinero;
    update(id: String, updateCocineroDto: UpdateCocineroDto): Cocinero;
    remove(id: String): void;
}
