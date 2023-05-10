# Tarea 3

Para esta tarea he utilizado dart_frog un framework de backend para Dart. Utilice postgres como base de datos.

## Servicio REST

Creacion de cocineros:

- POST ![post](./assets/ingresoCocineros.png)

Creacion de recetas:

- POST ![post](./assets/ingresoRecetas.png)

Creacion de preparación:

- POST ![post](./assets/ingresoPreparacion.png)

Obtener prepaciones:

- GET ![get](./assets/getPreparaciones.png)

## Creación de tags

Creación de tag inicial

```bash
$ docker build -t agiler1699/tarea3:paso3 .
```

- ![tag1](./assets/tag1.png)

Creación de tag multi stage

```bash
$ docker build -t agiler1699/tarea3:paso4 ./multi.Dockerfile -f
```

- ![tag1](./assets/tag2.png)

## Subir imagenes a dockerhub

![push](./assets/push.png)

## Probar imagenes de docker hub

![test](./assets/probar_tags.png)
