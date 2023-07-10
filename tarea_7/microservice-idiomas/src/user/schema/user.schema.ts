import * as mongoose from 'mongoose';

export const IdiomaSchema = new mongoose.Schema(
  {
    descripcion: { type: String, required: true },
  },
  { timestamps: true },
);

IdiomaSchema.index({ descripcion: 1 }, { unique: true });
