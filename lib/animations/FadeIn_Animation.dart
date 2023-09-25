// ignore_for_file: unused_field

import 'package:flutter/material.dart';

class FadeIn extends StatefulWidget {
  final AnimationController controller;
  final Animation animation;
  final Widget child;
  const FadeIn({
    Key? key,
    required this.controller,
    required this.animation,
    required this.child,
  }) : super(key: key);

  @override
  _FadeInState createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        return FadeTransition(
          opacity: kAlwaysCompleteAnimation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50.0 * (1.0 - widget.animation.value), 0.0),
            child: widget.child,
          ),
        );
      },
    );
  }
}

class MyCustomAnimation extends StatefulWidget {
  final child;
  const MyCustomAnimation({super.key, this.child});

  @override
  State<MyCustomAnimation> createState() => _MyCustomAnimationState();
}

class _MyCustomAnimationState extends State<MyCustomAnimation>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
    );

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      animation: Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: const Interval((1 / 7) * 0, 1.0, curve: Curves.fastOutSlowIn),
        ),
      ),
      controller: _animationController,
      child: widget.child,
    );
  }
}

class FadeInBounce extends StatefulWidget {
  final child;
  const FadeInBounce({super.key, this.child});

  @override
  State<FadeInBounce> createState() => _FadeInBounceState();
}

class _FadeInBounceState extends State<FadeInBounce>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 1), vsync: this)
        ..forward();

  late final Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.easeIn);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: MyCustomAnimation(
        child: widget.child,
      ),
    );
  }
}

class BouncingButton extends StatefulWidget {
  final child;

  const BouncingButton({super.key, this.child});
  @override
  _BouncingButtonState createState() => _BouncingButtonState();
}

class _BouncingButtonState extends State<BouncingButton>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0.0,
      upperBound: 0.1,
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return Listener(
      onPointerDown: (PointerDownEvent event) {
        _controller.forward();
      },
      onPointerUp: (PointerUpEvent event) {
        _controller.reverse();
      },
      child: Transform.scale(scale: _scale, child: widget.child),
    );
  }
}
