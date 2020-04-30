// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart';
import 'package:stackoverflow_client/data/data_sources/tags_data_source.dart';
import 'package:dio/src/dio.dart';
import 'package:stackoverflow_client/data/data_sources/questions_data_source.dart';
import 'package:stackoverflow_client/domain/questions_interactor.dart';
import 'package:stackoverflow_client/domain/tags_interactor.dart';
import 'package:stackoverflow_client/presentaion/screens/questions_by_tag/questions_view_model.dart';
import 'package:stackoverflow_client/presentaion/screens/tags/tags_view_model.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerLazySingleton<Dio>(
      () => Dio(BaseOptions(baseUrl: 'https://api.stackexchange.com')));
  g.registerFactory<QuestionsViewModel>(() => QuestionsViewModelImpl(
        g<QuestionsInteractor>(),
      ));
  g.registerFactory<TagsViewModel>(() => TagsViewModelImpl(
        g<TagsInteractor>(),
      ));
  _registerEagerSingletons(g, environment);
}

// Eager singletons must be registered in the right order
void _registerEagerSingletons(GetIt g, String environment) {
  g.registerSingleton<TagsDataSource>(TagsDataSourceImpl(
    g<Dio>(),
  ));
  g.registerSingleton<QuestionsDataSource>(QuestionsDataSourceImpl(
    g<Dio>(),
  ));
  g.registerSingleton<QuestionsInteractor>(QuestionsInteractorImpl(
    g<QuestionsDataSource>(),
  ));
  g.registerSingleton<TagsInteractor>(TagsInteractorImpl(
    g<TagsDataSource>(),
  ));
}
