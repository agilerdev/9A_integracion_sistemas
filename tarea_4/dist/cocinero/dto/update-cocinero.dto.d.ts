import { CreateCocineroDto } from './create-cocinero.dto';
declare const UpdateCocineroDto_base: import("@nestjs/mapped-types").MappedType<Partial<CreateCocineroDto>>;
export declare class UpdateCocineroDto extends UpdateCocineroDto_base {
    estado?: boolean;
}
export {};
