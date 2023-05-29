"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.CocineroService = void 0;
const common_1 = require("@nestjs/common");
const cocinero_entity_1 = require("./entities/cocinero.entity");
let CocineroService = class CocineroService {
    constructor() {
        this.cocineros = [
            { id: '1', nombre: 'Antonio Giler', sueldoBasico: 500, estado: true },
            { id: '2', nombre: 'Andres Macias', sueldoBasico: 500, estado: true }
        ];
    }
    create(createCocineroDto) {
        const cocinero = new cocinero_entity_1.Cocinero();
        cocinero.id = (Math.max(...this.cocineros.map(elemento => parseInt(elemento.id)), 0) + 1).toString();
        cocinero.nombre = createCocineroDto.nombre;
        cocinero.estado = true;
        this.cocineros.push(cocinero);
        return cocinero;
    }
    findAll() {
        return this.cocineros;
    }
    findOne(id) {
        const cocinero = this.cocineros.find(cocinero => cocinero.id === id);
        if (!cocinero)
            throw new common_1.NotFoundException(`ID ${id} not found`);
        return cocinero;
    }
    update(id, updateCocineroDto) {
        const { nombre, sueldoBasico, estado } = updateCocineroDto;
        const cocinero = this.findOne(id);
        if (nombre)
            cocinero.nombre = nombre;
        if (sueldoBasico)
            cocinero.sueldoBasico = sueldoBasico;
        if (estado != undefined)
            cocinero.estado = estado;
        this.cocineros = this.cocineros.map(elemento => {
            if (elemento.id === id)
                return cocinero;
            return elemento;
        });
        return cocinero;
    }
    remove(id) {
        this.findOne(id);
        this.cocineros = this.cocineros.filter(elemento => elemento.id !== id);
    }
};
CocineroService = __decorate([
    (0, common_1.Injectable)()
], CocineroService);
exports.CocineroService = CocineroService;
//# sourceMappingURL=cocinero.service.js.map