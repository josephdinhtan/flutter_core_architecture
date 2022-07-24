class ApiInjection {
  static void configureDependencies() {
    // API
    GetIt.I.registerLazySingleton<BookApi>(() => BookApi());
    GetIt.I.registerLazySingleton<TestApi>(() => TestApi());
    GetIt.I.registerLazySingleton<PartApi>(() => PartApi());
    GetIt.I.registerLazySingleton<QuestionGroupApi>(() => QuestionGroupApi());
  }
}
