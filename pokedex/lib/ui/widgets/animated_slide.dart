import 'package:flutter/material.dart';
import 'package:pokedex/core/extensions/context.dart';

class AnimatedSlide extends AnimatedWidget {
  const AnimatedSlide({
    required this.child,
    required this.animation,
  }) : super(listenable: animation);

  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final slideWidth = context.screenSize.width * 0.3;

    return Transform.translate(
      offset: Offset(slideWidth * (1 - animation.value), 0),
      child: child,
    );
  }
}
