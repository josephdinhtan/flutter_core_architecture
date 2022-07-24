import 'package:hive/hive.dart';
import '../../models/base_model.dart';

abstract class BaseDao<T extends BaseModel, N extends HiveObject> {
  Future<T?> query(String hiveId);
  Future<List<T>> queryAll(List<String> hiveIds);
  Future<bool> insert(N item, String hiveId);
  Future<bool> delete(String hiveId);
  Future<bool> update(N item);
}
