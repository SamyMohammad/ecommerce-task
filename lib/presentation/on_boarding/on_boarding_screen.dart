import 'package:ecommerce_task/app/di.dart';
import 'package:ecommerce_task/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../app/app_prefs.dart';
import '../../app/size_config.dart';
import 'on_boarding_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _currentPage = 0;
  // List colors = [const Color(0xffDAD3C8), const Color(0xffFFE5DE), const Color(0xffDCF6E6)];

  AnimatedContainer _buildDots({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(50),
          ),
          color: Theme.of(context).primaryColor),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }

  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          stops: [0.3, 0.5, 0.9],
          colors: [Color(0xFFC8D3FF), Color(0xFFD7DDFF), Color(0xFFECEAFF)],
        )),
        child: SafeArea(
          child: Column(
            children: [
              buildPageView(height, width),
              buildButtons(context, width),
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildButtons(BuildContext context, double width) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildDots(),
          isLast == true
              ? buildStartButton(context, width)
              : buildSkipAndNext(context, width)
        ],
      ),
    );
  }

  Padding buildSkipAndNext(BuildContext context, double width) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () async {
              await instance<AppPreferences>()
                  .setOnBoardingScreenViewed()
                  .then((value) {
                Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
              });
            },
            style: TextButton.styleFrom(
              elevation: 0,
              textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: (width <= 550) ? 13 : 17,
              ),
            ),
            child: Text(
              "SKIP",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _controller.nextPage(
                duration: const Duration(milliseconds: 100),
                curve: Curves.fastLinearToSlowEaseIn,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              elevation: 0,
              padding: (width <= 550)
                  ? const EdgeInsets.symmetric(horizontal: 30, vertical: 20)
                  : const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
              textStyle: TextStyle(fontSize: (width <= 550) ? 13 : 17),
            ),
            child: const Text("NEXT"),
          ),
        ],
      ),
    );
  }

  Padding buildStartButton(BuildContext context, double width) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: (width <= 550)
              ? const EdgeInsets.symmetric(horizontal: 100, vertical: 20)
              : EdgeInsets.symmetric(horizontal: width * 0.2, vertical: 25),
          textStyle: TextStyle(fontSize: (width <= 550) ? 13 : 17),
        ),
        child: const Text("START"),
      ),
    );
  }

  Row buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        contents.length,
        (int index) => _buildDots(index: index),
      ),
    );
  }

  Expanded buildPageView(double height, double width) {
    return Expanded(
      flex: 3,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: _controller,
        onPageChanged: (value) => setState(() {
          _currentPage = value;
          if (value == contents.length - 1) {
            isLast = true;
            setState(() {});
          } else {
            isLast = false;
            setState(() {});
          }
        }),
        itemCount: contents.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                SvgPicture.asset(
                  contents[i].image,
                  height: SizeConfig.blockV! * 35,
                ),
                SizedBox(
                  height: (height >= 840) ? 60 : 30,
                ),
                Text(
                  contents[i].title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Mulish",
                    fontWeight: FontWeight.w600,
                    fontSize: (width <= 550) ? 30 : 35,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  contents[i].desc,
                  maxLines: 1,
                  style: TextStyle(
                    fontFamily: "Mulish",
                    fontWeight: FontWeight.w300,
                    fontSize: (width <= 550) ? 17 : 25,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
