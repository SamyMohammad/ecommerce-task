import 'dart:async';

import 'package:ecommerce_task/app/di.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../app/app_prefs.dart';
import '../../../data/local/data_sources/user_secure_storage.dart';
import '../../resources/constants_manager.dart';
import '../../resources/routes_manager.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> slidingAnimation;
  late Animation<Offset> fadingAnimation;

  Timer? _timer;

  @override
  void initState() {
    initSlidingAnimation();

    _startDelay();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();

    animationController.dispose();
    super.dispose();
  }

  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), goNext);
  }

  Future<String?> goNext() async {
    final token = await SecureStorage.readToken();
    final isOnBoardingScreenViewed =
        await instance<AppPreferences>().isOnBoardingScreenViewed();
    print(token);
    if (isOnBoardingScreenViewed) {
      if (token == null) {
        if (mounted) {
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.loginRoute, (route) => false);
        }
      } else {
        if (mounted) {
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.bottomNavBarRouteRoute, (route) => false);
        }
      }
    } else {
      if (mounted) {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.onBoardingRoute, (route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SlidingLogo(
          slidingAnimation: slidingAnimation,
          fadingAnimation: fadingAnimation,
        ),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    slidingAnimation =
        Tween<double>(begin: 0, end: 1).animate(animationController);
    fadingAnimation = Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
        .animate(animationController);
    animationController.forward();
  }
}

class SlidingLogo extends StatelessWidget {
  const SlidingLogo({
    Key? key,
    required this.slidingAnimation,
    required this.fadingAnimation,
  }) : super(key: key);

  final Animation<double> slidingAnimation;
  final Animation<Offset> fadingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: fadingAnimation,
            child: FadeTransition(
              opacity: slidingAnimation,
              child: Image.asset('assets/2741840.jpg'),
            ),
          );
        });
  }
}
