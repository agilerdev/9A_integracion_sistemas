// ignore_for_file: annotate_overrides

part of 'preparacion.dart';

extension PreparacionRepositories on Database {
  PreparacionRepository get preparacions => PreparacionRepository._(this);
}

abstract class PreparacionRepository
    implements
        ModelRepository,
        KeyedModelRepositoryInsert<PreparacionInsertRequest>,
        ModelRepositoryUpdate<PreparacionUpdateRequest>,
        ModelRepositoryDelete<int> {
  factory PreparacionRepository._(Database db) = _PreparacionRepository;

  Future<PreparacionView?> queryPreparacion(int id);
  Future<List<PreparacionView>> queryPreparacions([QueryParams? params]);
}

class _PreparacionRepository extends BaseRepository
    with
        KeyedRepositoryInsertMixin<PreparacionInsertRequest>,
        RepositoryUpdateMixin<PreparacionUpdateRequest>,
        RepositoryDeleteMixin<int>
    implements PreparacionRepository {
  _PreparacionRepository(super.db) : super(tableName: 'preparacions', keyName: 'id');

  @override
  Future<PreparacionView?> queryPreparacion(int id) {
    return queryOne(id, PreparacionViewQueryable());
  }

  @override
  Future<List<PreparacionView>> queryPreparacions([QueryParams? params]) {
    return queryMany(PreparacionViewQueryable(), params);
  }

  @override
  Future<List<int>> insert(List<PreparacionInsertRequest> requests) async {
    if (requests.isEmpty) return [];
    var values = QueryValues();
    var rows = await db.query(
      'INSERT INTO "preparacions" ( "fecha", "hora", "cantidad_productos_preparar", "costo", "tiempo_estimado", "cocinero_id", "receta_id" )\n'
      'VALUES ${requests.map((r) => '( ${values.add(r.fecha)}:text, ${values.add(r.hora)}:text, ${values.add(r.cantidadProductosPreparar)}:int8, ${values.add(r.costo)}:float8, ${values.add(r.tiempoEstimado)}:text, ${values.add(r.cocineroId)}:int8, ${values.add(r.recetaId)}:int8 )').join(', ')}\n'
      'RETURNING "id"',
      values.values,
    );
    var result = rows.map<int>((r) => TextEncoder.i.decode(r.toColumnMap()['id'])).toList();

    return result;
  }

  @override
  Future<void> update(List<PreparacionUpdateRequest> requests) async {
    if (requests.isEmpty) return;
    var values = QueryValues();
    await db.query(
      'UPDATE "preparacions"\n'
      'SET "fecha" = COALESCE(UPDATED."fecha", "preparacions"."fecha"), "hora" = COALESCE(UPDATED."hora", "preparacions"."hora"), "cantidad_productos_preparar" = COALESCE(UPDATED."cantidad_productos_preparar", "preparacions"."cantidad_productos_preparar"), "costo" = COALESCE(UPDATED."costo", "preparacions"."costo"), "tiempo_estimado" = COALESCE(UPDATED."tiempo_estimado", "preparacions"."tiempo_estimado"), "cocinero_id" = COALESCE(UPDATED."cocinero_id", "preparacions"."cocinero_id"), "receta_id" = COALESCE(UPDATED."receta_id", "preparacions"."receta_id")\n'
      'FROM ( VALUES ${requests.map((r) => '( ${values.add(r.id)}:int8::int8, ${values.add(r.fecha)}:text::text, ${values.add(r.hora)}:text::text, ${values.add(r.cantidadProductosPreparar)}:int8::int8, ${values.add(r.costo)}:float8::float8, ${values.add(r.tiempoEstimado)}:text::text, ${values.add(r.cocineroId)}:int8::int8, ${values.add(r.recetaId)}:int8::int8 )').join(', ')} )\n'
      'AS UPDATED("id", "fecha", "hora", "cantidad_productos_preparar", "costo", "tiempo_estimado", "cocinero_id", "receta_id")\n'
      'WHERE "preparacions"."id" = UPDATED."id"',
      values.values,
    );
  }
}

class PreparacionInsertRequest {
  PreparacionInsertRequest({
    required this.fecha,
    required this.hora,
    required this.cantidadProductosPreparar,
    required this.costo,
    required this.tiempoEstimado,
    required this.cocineroId,
    required this.recetaId,
  });

  final String fecha;
  final String hora;
  final int cantidadProductosPreparar;
  final double costo;
  final String tiempoEstimado;
  final int cocineroId;
  final int recetaId;
}

class PreparacionUpdateRequest {
  PreparacionUpdateRequest({
    required this.id,
    this.fecha,
    this.hora,
    this.cantidadProductosPreparar,
    this.costo,
    this.tiempoEstimado,
    this.cocineroId,
    this.recetaId,
  });

  final int id;
  final String? fecha;
  final String? hora;
  final int? cantidadProductosPreparar;
  final double? costo;
  final String? tiempoEstimado;
  final int? cocineroId;
  final int? recetaId;
}

class PreparacionViewQueryable extends KeyedViewQueryable<PreparacionView, int> {
  @override
  String get keyName => 'id';

  @override
  String encodeKey(int key) => TextEncoder.i.encode(key);

  @override
  String get query =>
      'SELECT "preparacions".*, row_to_json("cocinero".*) as "cocinero", row_to_json("receta".*) as "receta"'
      'FROM "preparacions"'
      'LEFT JOIN (${CocineroViewQueryable().query}) "cocinero"'
      'ON "preparacions"."cocinero_id" = "cocinero"."id"'
      'LEFT JOIN (${RecetaViewQueryable().query}) "receta"'
      'ON "preparacions"."receta_id" = "receta"."id"';

  @override
  String get tableAlias => 'preparacions';

  @override
  PreparacionView decode(TypedMap map) => PreparacionView(
      id: map.get('id'),
      fecha: map.get('fecha'),
      hora: map.get('hora'),
      cantidadProductosPreparar: map.get('cantidad_productos_preparar'),
      costo: map.get('costo'),
      tiempoEstimado: map.get('tiempo_estimado'),
      cocinero: map.get('cocinero', CocineroViewQueryable().decoder),
      receta: map.get('receta', RecetaViewQueryable().decoder));
}

class PreparacionView {
  PreparacionView({
    required this.id,
    required this.fecha,
    required this.hora,
    required this.cantidadProductosPreparar,
    required this.costo,
    required this.tiempoEstimado,
    required this.cocinero,
    required this.receta,
  });

  final int id;
  final String fecha;
  final String hora;
  final int cantidadProductosPreparar;
  final double costo;
  final String tiempoEstimado;
  final CocineroView cocinero;
  final RecetaView receta;
}
