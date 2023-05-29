"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.CocineroController = void 0;
const common_1 = require("@nestjs/common");
const cocinero_service_1 = require("./cocinero.service");
const create_cocinero_dto_1 = require("./dto/create-cocinero.dto");
const update_cocinero_dto_1 = require("./dto/update-cocinero.dto");
let CocineroController = class CocineroController {
    constructor(cocineroService) {
        this.cocineroService = cocineroService;
    }
    create(createCocineroDto) {
        return this.cocineroService.create(createCocineroDto);
    }
    findAll() {
        return this.cocineroService.findAll();
    }
    findOne(id) {
        return this.cocineroService.findOne(id);
    }
    update(id, updateCocineroDto) {
        return this.cocineroService.update(id, updateCocineroDto);
    }
    remove(id) {
        return this.cocineroService.remove(id);
    }
};
__decorate([
    (0, common_1.Post)(),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [create_cocinero_dto_1.CreateCocineroDto]),
    __metadata("design:returntype", void 0)
], CocineroController.prototype, "create", null);
__decorate([
    (0, common_1.Get)(),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", void 0)
], CocineroController.prototype, "findAll", null);
__decorate([
    (0, common_1.Get)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", void 0)
], CocineroController.prototype, "findOne", null);
__decorate([
    (0, common_1.Patch)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __param(1, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, update_cocinero_dto_1.UpdateCocineroDto]),
    __metadata("design:returntype", void 0)
], CocineroController.prototype, "update", null);
__decorate([
    (0, common_1.Delete)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", void 0)
], CocineroController.prototype, "remove", null);
CocineroController = __decorate([
    (0, common_1.Controller)('cocinero'),
    __metadata("design:paramtypes", [cocinero_service_1.CocineroService])
], CocineroController);
exports.CocineroController = CocineroController;
//# sourceMappingURL=cocinero.controller.js.map