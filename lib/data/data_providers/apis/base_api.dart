import '../../models/base_model.dart';
import '../dtos/base_dto.dart';

abstract class BaseApi<T extends BaseModel, N extends BaseDto> {
  Future<T?> query(String hiveId);
  Future<List<T>> queryAll(List<String> hiveIds);
  Future<bool> insert(N item, String hiveId);
  Future<bool> delete(String hiveId);
  Future<bool> update(N item);
}
