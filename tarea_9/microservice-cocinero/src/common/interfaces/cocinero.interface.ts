export interface ICocinero extends Document {
  _id?: string;
  nombre: string;
  sueldoBasico: number;
  estado: boolean;
}
