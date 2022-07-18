import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/screen/home_page.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentIndex = 0;
  int lastIndex = 0;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[400],
      body: Stack(children: [
        CustomPaint(
          painter: ArcPainter(),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.4,
          ),
        ),
        Positioned(
          right: 10,
          left: 10,
          top: 70,
          child: Lottie.asset(tabs[_currentIndex].lottieFile,
              key: Key('${Random().nextInt(999999999)}'),
              width: 600,
              alignment: Alignment.topCenter),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .27,
            child: Column(
              children: [
                Flexible(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: 3,
                    itemBuilder: ((context, index) {
                      OnboardingModel tab = tabs[index];
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            tab.title,
                            style: const TextStyle(
                                fontSize: 27, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*.04),
                          Text(
                            tab.subtitle,
                            style: TextStyle(
                                fontSize: 17, color: Colors.blueGrey[900]),
                            textAlign: TextAlign.center,
                          )
                        ],
                      );
                    }),
                    onPageChanged: (value) {
                      _currentIndex = value;

                      setState(() {});
                    },
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int index = 0; index < tabs.length; index++)
                      _DotIndicator(isSelected: index == _currentIndex)
                  ],
                ),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_currentIndex == 2) {
              Get.to(
                HomePage(),
                transition: Transition.rightToLeft,
                curve: Curves.easeIn,
              );
            }
            _pageController.nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.linear);
          },
          child: Icon(Icons.arrow_right_alt_rounded,
              size: 50, color: Colors.blueGrey[900]),
          backgroundColor: Colors.transparent,
          disabledElevation: 0,
          autofocus: false,
          focusColor: Colors.transparent,
          hoverElevation: 0,
          highlightElevation: 0,
          elevation: 0),
    );
  }
}

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path orangePath = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height - 170)
      ..quadraticBezierTo(
          size.width / 2, size.height, size.width, size.height - 170)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(orangePath, Paint()..color = Colors.orange[400]!);

    Path whitePath = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height - 185)
      ..quadraticBezierTo(
          size.width / 2, size.height - 70, size.width, size.height - 185)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(whitePath, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class OnboardingModel {
  final String lottieFile;
  final String title;
  final String subtitle;

  OnboardingModel(this.lottieFile, this.title, this.subtitle);
}

List<OnboardingModel> tabs = [
  OnboardingModel(
    'assets/order.json',
    'Choose A Order',
    'When you order Eat Street, \nwe\'ll hook you up with exclusive \ncoupons.',
  ),
  OnboardingModel(
    'assets/interaction.json',
    'Discover Places',
    'We make it sample to find the \nfood you crave. Enter your \naddress and let',
  ),
  OnboardingModel(
    'assets/delivery.json',
    'Pick Up Order',
    'We make food ordering fast , \n simple and free -no master if you \norder',
  ),
];

class _DotIndicator extends StatelessWidget {
  final bool isSelected;
  const _DotIndicator({Key? key, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 5),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 8,
        width: 8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.blueGrey[900] : Colors.white,
        ),
      ),
    );
  }
}
