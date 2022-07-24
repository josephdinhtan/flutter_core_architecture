import '../../models/base_model.dart';

abstract class BaseDto<T extends BaseModel> {
  T toBusinessModel();
}
