import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stackoverflow_client/di/injection.iconfig.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
void configureInjection(String environment) =>
    $initGetIt(getIt, environment: environment);

abstract class Env {
  static const dev = 'Development';
  static const prod = 'Production';
}
