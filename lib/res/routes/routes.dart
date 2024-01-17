import 'package:get/get.dart';
import 'package:getx_statemanagment_mvvm/res/routes/routes_name.dart';
import 'package:getx_statemanagment_mvvm/view/home/home_view.dart';
import 'package:getx_statemanagment_mvvm/view/login/login_view.dart';
import 'package:getx_statemanagment_mvvm/view/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RouteName.splashScreen,
            page: () => const SplashScreen(),
            transitionDuration: const Duration(milliseconds: 250),
            transition: Transition.leftToRight),
        GetPage(
            name: RouteName.loginView,
            page: () => const LoginView(),
            transitionDuration: const Duration(milliseconds: 250),
            transition: Transition.leftToRight),
        GetPage(
            name: RouteName.homeView,
            page: () => const HomeView(),
            transitionDuration: const Duration(milliseconds: 250),
            transition: Transition.leftToRight),
      ];
}
