import 'package:campus_connect/presentation/screens/Auth/views/complete_registration_view.dart';
import 'package:campus_connect/presentation/screens/Auth/views/register_view.dart';
import 'package:campus_connect/presentation/screens/Dashboard/dashboard_view.dart';
import 'package:campus_connect/presentation/screens/splash/splash_view.dart';
import 'package:get/route_manager.dart';

class AppRoutes {
  static List<GetPage<dynamic>> getRoutes() => [
        GetPage(
          name: SplashView.route,
          page: () => SplashView(),
        ),
        GetPage(
          name: RegisterView.route,
          page: () => RegisterView(),
          transition: Transition.upToDown,
        ),
        GetPage(
          name: CompleteProfileView.route,
          page: () => CompleteProfileView(),
          transition: Transition.upToDown,
        ),
        GetPage(
          name: DashboardView.route,
          page: () => DashboardView(),
          transition: Transition.upToDown,
        ),
      ];
}
