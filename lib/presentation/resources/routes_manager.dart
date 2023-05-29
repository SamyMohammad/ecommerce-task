import 'package:ecommerce_task/presentation/BottomNavbar.dart';
import 'package:ecommerce_task/presentation/cart/screen/cart_screen.dart';
import 'package:ecommerce_task/presentation/home/screen/home_screen.dart';
import 'package:ecommerce_task/presentation/home/screen/product_details.dart';
import 'package:ecommerce_task/presentation/on_boarding/on_boarding_screen.dart';
import 'package:ecommerce_task/presentation/search/screen/search_screen.dart';
import 'package:flutter/material.dart';

import '../../app/app_navigator.dart';
import '../login/screen/login_screen.dart';
import '../registeration/screen/registration1_screen.dart';
import '../splash/screen/splash_screen.dart';

class Routes {
  static const String splashRoute = "/splash";
  static const String loginRoute = "/login";
  static const String register1Route = "/register1";
  static const String homeScreenRoute = "/homeScreenRoute";
  static const String profileRoute = "/profile";
  static const String onBoardingRoute = "/onBoardingRoute";
  static const String searchRoute = "/search";
  static const String productDetailsRoute = "/productDetails";
  static const String cartRoute = "/cartRoute";
  static const String bottomNavBarRouteRoute = "/bottomNavBarRoute";
}

class RouteGenerator {
  static Route<dynamic>? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(
            builder: (_) => LoginScreen(onSignInSuccess: () {
                  AppNavigator.instance.removeUntil(const HomeScreen());
                }));

      case Routes.register1Route:
        return MaterialPageRoute(
            builder: (_) => Registration1Screen(
                  onSignUpSuccess: () {
                    AppNavigator.instance
                        .removeUntil(LoginScreen(onSignInSuccess: () {
                      // AppNavigator.instance.removeUntil(const MainScreen());
                    }));
                  },
                ));

      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.homeScreenRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.searchRoute:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case Routes.cartRoute:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case Routes.productDetailsRoute:
        return MaterialPageRoute(
            builder: (_) => const ProductDetailsScreen(), settings: settings);
      case Routes.bottomNavBarRouteRoute:
        return MaterialPageRoute(
          builder: (_) => const BottomNavbar(),
          settings: settings,
        );
      default:
        return null;
    }
  }
}
