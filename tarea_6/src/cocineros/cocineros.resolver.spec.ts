import { Test, TestingModule } from '@nestjs/testing';
import { CocinerosResolver } from './cocineros.resolver';
import { CocinerosService } from './cocineros.service';

describe('CocinerosResolver', () => {
  let resolver: CocinerosResolver;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [CocinerosResolver, CocinerosService],
    }).compile();

    resolver = module.get<CocinerosResolver>(CocinerosResolver);
  });

  it('should be defined', () => {
    expect(resolver).toBeDefined();
  });
});
