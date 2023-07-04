import * as mongoose from 'mongoose';

export const CocineroSchema = new mongoose.Schema(
  {
    nombre: { type: String, required: true },
    sueldoBasico: { type: Number, required: true },
    estado: { type: Boolean, required: true },
  },
  { timestamps: true },
);
