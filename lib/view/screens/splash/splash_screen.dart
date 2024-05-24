import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/view/screens/home/home_screen.dart';
class TodoSplashScreen extends StatelessWidget {
  const TodoSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 3000,
        splash: Image.asset('assets/images/todo-icon-1024x1024-7nszgsj6.png'),
        nextScreen: TasksHomeScreen(),
        splashIconSize: 200,
        splashTransition: SplashTransition.fadeTransition,
    );
  }
}
