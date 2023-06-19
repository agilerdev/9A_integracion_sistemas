import { Module } from "@nestjs/common";
import { CocinerosService } from "./cocineros.service";
import { CocinerosResolver } from "./cocineros.resolver";
import { TypeOrmModule } from "@nestjs/typeorm";
import { Cocinero } from "./entities/cocinero.entity";

@Module({
  providers: [CocinerosResolver, CocinerosService],
  imports: [TypeOrmModule.forFeature([Cocinero])],
})
export class CocinerosModule {}
