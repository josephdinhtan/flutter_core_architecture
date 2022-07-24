import 'api_injection.dart';
import 'cubit_injection.dart';
import 'dao_injection.dart';
import 'repository_injection.dart';
import 'use_case_injection.dart';

void configureDependencies() {
  UseCaseInjection.configureDependencies();
  CubitInjection.configureDependencies();
  RepositoryInjection.configureDependencies();
  ApiInjection.configureDependencies();
  DaoInjection.configureDependencies();
}
