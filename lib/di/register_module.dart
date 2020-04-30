import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@registerModule
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio(BaseOptions(baseUrl: 'https://api.stackexchange.com'));
}
