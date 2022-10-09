import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:gesture/main.dart';
import 'package:gesture/button.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
    child: IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'What is SignSnap?',
          body: 'SignSnap is a digital App Signature Verifier, it is used to determine whether a signature is fake or not',
          image: buildImage('assets/sitting.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Why SignSnap?',
          body: 'Easy To use and available right at your fingertips and fastest way to verify signatures',
          image: buildImage('assets/sit.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Simple UI',
          body: 'The app is easy to use it requires very less knowledge to operate',
          image: buildImage('assets/re.jpg'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Lets Get Started......',
          body: 'Start your journey',
          footer: ButtonWidget(
            text: 'Click Here',
            onClicked: () => goToHome(context),
          ),
          image: buildImage('assets/stuck.png'),
          decoration: getPageDecoration(),
        ),
      ],
      done: Text('Read', style: TextStyle(fontWeight: FontWeight.w600)),
      onDone: () => goToHome(context),
      showSkipButton: true,
      skip: Text('Skip',style:TextStyle(color: Colors.white)),
      onSkip: () => goToHome(context),
      next: Icon(Icons.arrow_forward),
      dotsDecorator: getDotDecoration(),
      onChange: (index) => print('Page $index selected'),
      globalBackgroundColor: Theme.of(context).primaryColor,
      nextFlex: 0,
      // isProgressTap: false,
      // isProgress: false,
      // showNextButton: false,
      // freeze: true,
      // animationDuration: 1000,
    ),
  );

  void goToHome(context) => Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => MyApp()),
  );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
    color: Color(0xFFFFFFFF),
    //activeColor: Colors.orange,
    size: Size(10, 10),
    activeSize: Size(22, 10),
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
  );

  PageDecoration getPageDecoration() => PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    bodyTextStyle: TextStyle(fontSize: 20),
    imagePadding: EdgeInsets.all(24),
    pageColor: Colors.white,
    bodyPadding: EdgeInsets.all(16).copyWith(bottom: 0),

  );
}