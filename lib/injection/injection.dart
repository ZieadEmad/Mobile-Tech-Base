import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:arch/injection/injection.config.dart' as s;

final GetIt getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection(String env) async {
  await s.GetItInjectableX(getIt).init(environment: env);
}
