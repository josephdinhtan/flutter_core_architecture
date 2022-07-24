// ignore_for_file: non_constant_identifier_names

abstract class BaseUseCase<Out, In> {
  Future<Out> perform(In);
}
