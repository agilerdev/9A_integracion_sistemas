import * as mongoose from 'mongoose';

export const PrestamistaSchema = new mongoose.Schema({
  nombre: { type: String, required: true },
  identificacion: { type: String, required: true },
});
