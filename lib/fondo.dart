// import 'dart:math';
import 'package:flutter/material.dart';

class Fondo extends StatefulWidget {
  const Fondo({Key? key}) : super(key: key);

  @override
  _FondoState createState() => _FondoState();
}

class _FondoState extends State<Fondo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat(reverse: true);
    _colorAnimation = _controller.drive(ColorTween(
      begin: Colors.blue,
      end: Colors.pink,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                _colorAnimation.value!,
                Color.lerp(_colorAnimation.value!, Colors.black, 0.8)!,
              ],
            ),
          ),
        );
      },
    );
  }
}
