import 'package:flutter/material.dart';
import 'screens.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flashchat/components/components.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  const WelcomeScreen({super.key});
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(_controller);
    _controller.forward();

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 60.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                Flexible(
                  child: AnimatedTextKit(animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle: const TextStyle(
                        color: Colors.black54,
                        fontSize: 45.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ]),
                )
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              key: UniqueKey(),
              title: 'Log In',
              color: Colors.lightBlueAccent,
              onPressed: () => Navigator.pushNamed(context, LoginScreen.id),
            ),
            RoundedButton(
              key: UniqueKey(),
              title: 'Register',
              color: Colors.blueAccent,
              onPressed: () =>
                  Navigator.pushNamed(context, RegistrationScreen.id),
            ),
          ],
        ),
      ),
    );
  }
}
