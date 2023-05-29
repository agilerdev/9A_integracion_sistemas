import { CocineroService } from './cocinero.service';
import { CreateCocineroDto } from './dto/create-cocinero.dto';
import { UpdateCocineroDto } from './dto/update-cocinero.dto';
export declare class CocineroController {
    private readonly cocineroService;
    constructor(cocineroService: CocineroService);
    create(createCocineroDto: CreateCocineroDto): import("./entities/cocinero.entity").Cocinero;
    findAll(): import("./entities/cocinero.entity").Cocinero[];
    findOne(id: string): import("./entities/cocinero.entity").Cocinero;
    update(id: string, updateCocineroDto: UpdateCocineroDto): import("./entities/cocinero.entity").Cocinero;
    remove(id: string): void;
}
