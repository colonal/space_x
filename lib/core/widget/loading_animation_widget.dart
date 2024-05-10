import 'dart:math' as math;

import 'package:flutter/material.dart';

class LoadingAnimationWidget extends StatefulWidget {
  final Duration? duration;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  const LoadingAnimationWidget(
      {this.duration, this.borderRadius, this.color, super.key});

  @override
  State<LoadingAnimationWidget> createState() => _LoadingAnimationWidgetState();
}

class _LoadingAnimationWidgetState extends State<LoadingAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> animationOne;
  late Animation<Color?> animationTow;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration ?? const Duration(milliseconds: 500),
    );

    animationOne =
        AlignmentTween(begin: Alignment.topLeft, end: Alignment.topRight)
            .animate(_controller);

    _controller.forward();

    _controller.addListener(() {
      if (_controller.status == AnimationStatus.completed) {
        _controller.forward(from: 0);
      } else if (_controller.status == AnimationStatus.dismissed) {
        _controller.forward();
      }
      setState(() {});
    });
  }

  Color get color => widget.color ?? Theme.of(context).disabledColor;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return ClipRRect(
        borderRadius: widget.borderRadius ?? BorderRadius.circular(0),
        child: SizedBox(
          width: constraints.maxWidth,
          height: constraints.minHeight,
          child: Stack(
            alignment: animationOne.value,
            fit: StackFit.loose,
            clipBehavior: Clip.hardEdge,
            children: [
              Container(
                width: constraints.maxWidth,
                height: constraints.minHeight,
                alignment: AlignmentDirectional.topStart,
                decoration: BoxDecoration(color: color.withOpacity(0.1)),
              ),
              Transform.scale(
                scale: 1.5,
                child: Transform.rotate(
                  angle: math.pi / 10,
                  child: Container(
                    width: 20,
                    alignment: Alignment.center,
                    height: constraints.maxHeight,
                    decoration: BoxDecoration(
                      color: color.withOpacity(.35),
                      boxShadow: [
                        BoxShadow(
                          color: color.withOpacity(.75),
                          blurRadius: 15,
                          spreadRadius: 0,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
