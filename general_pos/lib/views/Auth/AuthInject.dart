import './AuthController.dart';
import './AuthPage.dart';
import './AuthRoute.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

void injectAuth(GetIt getIt) {
  getIt.registerSingleton(AuthPage());
  getIt.registerSingleton(AuthRoute());
  getIt.registerSingleton(AuthController(view: getIt<AuthPage>()));
  getIt<GoRouter>().configuration.routes.add(getIt<AuthRoute>().route);
  print("\t~>\tAuth injected;");
}
