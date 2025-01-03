import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interior/app/modules/onboarding/view/onboarding_view.dart';
// import 'package:interior/assets/assets.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static String routeName = '/';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  final int splashDuration = 3;
  late final AnimationController controller;
  late final opacityTween = Tween(begin: 0, end: 1);

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    controller.forward();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    Timer(Duration(seconds: splashDuration), checkLogin);
    super.initState();
  }

  void checkLogin() {
    context.go(OnboardingView.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) => AnimatedOpacity(
            opacity: controller.value,
            duration: Duration(milliseconds: 800),
            // child: Image.asset(Assets.splash),
          ),
        ),
      ),
    );
  }
}
