// ignore_for_file: annotate_overrides

part of 'receta.dart';

extension RecetaRepositories on Database {
  RecetaRepository get recetas => RecetaRepository._(this);
}

abstract class RecetaRepository
    implements
        ModelRepository,
        KeyedModelRepositoryInsert<RecetaInsertRequest>,
        ModelRepositoryUpdate<RecetaUpdateRequest>,
        ModelRepositoryDelete<int> {
  factory RecetaRepository._(Database db) = _RecetaRepository;

  Future<RecetaView?> queryReceta(int id);
  Future<List<RecetaView>> queryRecetas([QueryParams? params]);
}

class _RecetaRepository extends BaseRepository
    with
        KeyedRepositoryInsertMixin<RecetaInsertRequest>,
        RepositoryUpdateMixin<RecetaUpdateRequest>,
        RepositoryDeleteMixin<int>
    implements RecetaRepository {
  _RecetaRepository(super.db) : super(tableName: 'recetas', keyName: 'id');

  @override
  Future<RecetaView?> queryReceta(int id) {
    return queryOne(id, RecetaViewQueryable());
  }

  @override
  Future<List<RecetaView>> queryRecetas([QueryParams? params]) {
    return queryMany(RecetaViewQueryable(), params);
  }

  @override
  Future<List<int>> insert(List<RecetaInsertRequest> requests) async {
    if (requests.isEmpty) return [];
    var values = QueryValues();
    var rows = await db.query(
      'INSERT INTO "recetas" ( "nombre_plato", "ingredientes_cantidades" )\n'
      'VALUES ${requests.map((r) => '( ${values.add(r.nombrePlato)}:text, ${values.add(r.ingredientesCantidades)}:text )').join(', ')}\n'
      'RETURNING "id"',
      values.values,
    );
    var result = rows.map<int>((r) => TextEncoder.i.decode(r.toColumnMap()['id'])).toList();

    return result;
  }

  @override
  Future<void> update(List<RecetaUpdateRequest> requests) async {
    if (requests.isEmpty) return;
    var values = QueryValues();
    await db.query(
      'UPDATE "recetas"\n'
      'SET "nombre_plato" = COALESCE(UPDATED."nombre_plato", "recetas"."nombre_plato"), "ingredientes_cantidades" = COALESCE(UPDATED."ingredientes_cantidades", "recetas"."ingredientes_cantidades")\n'
      'FROM ( VALUES ${requests.map((r) => '( ${values.add(r.id)}:int8::int8, ${values.add(r.nombrePlato)}:text::text, ${values.add(r.ingredientesCantidades)}:text::text )').join(', ')} )\n'
      'AS UPDATED("id", "nombre_plato", "ingredientes_cantidades")\n'
      'WHERE "recetas"."id" = UPDATED."id"',
      values.values,
    );
  }
}

class RecetaInsertRequest {
  RecetaInsertRequest({
    required this.nombrePlato,
    required this.ingredientesCantidades,
  });

  final String nombrePlato;
  final String ingredientesCantidades;
}

class RecetaUpdateRequest {
  RecetaUpdateRequest({
    required this.id,
    this.nombrePlato,
    this.ingredientesCantidades,
  });

  final int id;
  final String? nombrePlato;
  final String? ingredientesCantidades;
}

class RecetaViewQueryable extends KeyedViewQueryable<RecetaView, int> {
  @override
  String get keyName => 'id';

  @override
  String encodeKey(int key) => TextEncoder.i.encode(key);

  @override
  String get query => 'SELECT "recetas".*'
      'FROM "recetas"';

  @override
  String get tableAlias => 'recetas';

  @override
  RecetaView decode(TypedMap map) => RecetaView(
      id: map.get('id'),
      nombrePlato: map.get('nombre_plato'),
      ingredientesCantidades: map.get('ingredientes_cantidades'));
}

class RecetaView {
  RecetaView({
    required this.id,
    required this.nombrePlato,
    required this.ingredientesCantidades,
  });

  final int id;
  final String nombrePlato;
  final String ingredientesCantidades;
}
