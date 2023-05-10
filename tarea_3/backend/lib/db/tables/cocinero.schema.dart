// ignore_for_file: annotate_overrides

part of 'cocinero.dart';

extension CocineroRepositories on Database {
  CocineroRepository get cocineros => CocineroRepository._(this);
}

abstract class CocineroRepository
    implements
        ModelRepository,
        KeyedModelRepositoryInsert<CocineroInsertRequest>,
        ModelRepositoryUpdate<CocineroUpdateRequest>,
        ModelRepositoryDelete<int> {
  factory CocineroRepository._(Database db) = _CocineroRepository;

  Future<CocineroView?> queryCocinero(int id);
  Future<List<CocineroView>> queryCocineros([QueryParams? params]);
}

class _CocineroRepository extends BaseRepository
    with
        KeyedRepositoryInsertMixin<CocineroInsertRequest>,
        RepositoryUpdateMixin<CocineroUpdateRequest>,
        RepositoryDeleteMixin<int>
    implements CocineroRepository {
  _CocineroRepository(super.db) : super(tableName: 'cocineros', keyName: 'id');

  @override
  Future<CocineroView?> queryCocinero(int id) {
    return queryOne(id, CocineroViewQueryable());
  }

  @override
  Future<List<CocineroView>> queryCocineros([QueryParams? params]) {
    return queryMany(CocineroViewQueryable(), params);
  }

  @override
  Future<List<int>> insert(List<CocineroInsertRequest> requests) async {
    if (requests.isEmpty) return [];
    var values = QueryValues();
    var rows = await db.query(
      'INSERT INTO "cocineros" ( "nombre", "sueldo_basico" )\n'
      'VALUES ${requests.map((r) => '( ${values.add(r.nombre)}:text, ${values.add(r.sueldoBasico)}:float8 )').join(', ')}\n'
      'RETURNING "id"',
      values.values,
    );
    var result = rows.map<int>((r) => TextEncoder.i.decode(r.toColumnMap()['id'])).toList();

    return result;
  }

  @override
  Future<void> update(List<CocineroUpdateRequest> requests) async {
    if (requests.isEmpty) return;
    var values = QueryValues();
    await db.query(
      'UPDATE "cocineros"\n'
      'SET "nombre" = COALESCE(UPDATED."nombre", "cocineros"."nombre"), "sueldo_basico" = COALESCE(UPDATED."sueldo_basico", "cocineros"."sueldo_basico")\n'
      'FROM ( VALUES ${requests.map((r) => '( ${values.add(r.id)}:int8::int8, ${values.add(r.nombre)}:text::text, ${values.add(r.sueldoBasico)}:float8::float8 )').join(', ')} )\n'
      'AS UPDATED("id", "nombre", "sueldo_basico")\n'
      'WHERE "cocineros"."id" = UPDATED."id"',
      values.values,
    );
  }
}

class CocineroInsertRequest {
  CocineroInsertRequest({
    required this.nombre,
    required this.sueldoBasico,
  });

  final String nombre;
  final double sueldoBasico;
}

class CocineroUpdateRequest {
  CocineroUpdateRequest({
    required this.id,
    this.nombre,
    this.sueldoBasico,
  });

  final int id;
  final String? nombre;
  final double? sueldoBasico;
}

class CocineroViewQueryable extends KeyedViewQueryable<CocineroView, int> {
  @override
  String get keyName => 'id';

  @override
  String encodeKey(int key) => TextEncoder.i.encode(key);

  @override
  String get query => 'SELECT "cocineros".*'
      'FROM "cocineros"';

  @override
  String get tableAlias => 'cocineros';

  @override
  CocineroView decode(TypedMap map) => CocineroView(
      id: map.get('id'), nombre: map.get('nombre'), sueldoBasico: map.get('sueldo_basico'));
}

class CocineroView {
  CocineroView({
    required this.id,
    required this.nombre,
    required this.sueldoBasico,
  });

  final int id;
  final String nombre;
  final double sueldoBasico;
}
