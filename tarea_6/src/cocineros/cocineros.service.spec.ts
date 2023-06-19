import { Test, TestingModule } from '@nestjs/testing';
import { CocinerosService } from './cocineros.service';

describe('CocinerosService', () => {
  let service: CocinerosService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [CocinerosService],
    }).compile();

    service = module.get<CocinerosService>(CocinerosService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
