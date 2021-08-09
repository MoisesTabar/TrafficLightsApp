import 'package:flutter/material.dart';

class GlowingAnimationIndicator extends StatefulWidget {

  late final int semaphoreColor;

  GlowingAnimationIndicator({
    required this.semaphoreColor 
  });

  @override
  _GlowingAnimationIndicatorState createState() => _GlowingAnimationIndicatorState();
}

class _GlowingAnimationIndicatorState extends State<GlowingAnimationIndicator> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 2.0, end: 15.0).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[850],
        boxShadow: [
          BoxShadow(
            color: Color(widget.semaphoreColor),
            blurRadius: _animation.value,
            spreadRadius: _animation.value
          )
        ]
      ), 
      curve: Curves.ease,
      duration: Duration(seconds: 1),
    );
  }
}