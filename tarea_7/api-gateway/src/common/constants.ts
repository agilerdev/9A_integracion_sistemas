export enum RabbitMQ {
  IdiomaQueue = 'idiomas',
  PrestamistaQueue = 'prestamistas',
  CocineroQueue = 'cocineros',
  StudentQueue = 'pacientes',
}

export enum UserMsg {
  CREATE = 'CREATE_IDIOMA',
  FIND_ALL = 'FIND_IDIOMAS',
  FIND_ONE = 'FIND_IDIOMA',
  UPDATE = 'UPDATE_IDIOMA',
  DELETE = 'DELETE_IDIOMA',
  VALID_USER = 'VALID_IDIOMA',
}

export enum StudentMsg {
  CREATE = 'CREATE_PACIENTE',
  FIND_ALL = 'FIND_PACIENTES',
  FIND_ONE = 'FIND_PACIENTE',
  UPDATE = 'UPDATE_PACIENTE',
  DELETE = 'DELETE_PACIENTE',
}

export enum PassengerMSG {
  CREATE = 'CREATE_PRESTAMISTAS',
  FIND_ALL = 'FIND_PRESTAMISTAS',
  FIND_ONE = 'FIND_PRESTAMISTAS',
  UPDATE = 'UPDATE_PRESTAMISTAS',
  DELETE = 'DELETE_PRESTAMISTAS',
}

export enum CocineroMSG {
  CREATE = 'CREATE_COCINERO',
  FIND_ALL = 'FIND_COCINEROS',
  FIND_ONE = 'FIND_COCINERO',
  UPDATE = 'UPDATE_COCINERO',
  DELETE = 'DELETE_COCINERO',
}
