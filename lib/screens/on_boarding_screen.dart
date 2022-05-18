import 'package:dots_indicator/dots_indicator.dart';
import 'package:five_star/constraints.dart';
import 'package:flutter/material.dart';

class onBoardingScreen extends StatefulWidget {
  onBoardingScreen({Key? key}) : super(key: key);

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

final _controller = PageController(
  initialPage: 0,
);

int _currentpage = 0;

List<Widget> _pages = [
  Column(
    children: [
      Expanded(child: Image.asset('assets/images/1.png')),
      Text(
        'Food App',
        style: kPageViewTextStyle,
        textAlign: TextAlign.center,
      ),
    ],
  ),
  Column(
    children: [
      Expanded(child: Image.asset('assets/images/2.png')),
      Text(
        'Grocery App',
        style: kPageViewTextStyle,
        textAlign: TextAlign.center,
      ),
    ],
  ),
  Column(
    children: [
      Expanded(child: Image.asset('assets/images/3.png')),
      Text(
        'Shoping App',
        style: kPageViewTextStyle,
        textAlign: TextAlign.center,
      ),
    ],
  ),
];

class _onBoardingScreenState extends State<onBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: _controller,
            children: _pages,
            onPageChanged: (index) {
              setState(() {
                _currentpage = index;
              });
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        DotsIndicator(
          dotsCount: _pages.length,
          position: _currentpage.toDouble(),
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            activeColor: Colors.deepOrangeAccent,
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
