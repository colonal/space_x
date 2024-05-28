import 'package:flutter/material.dart';

class OnboardingImageItemWidget extends StatefulWidget {
  final String image;
  const OnboardingImageItemWidget({required this.image, super.key});

  @override
  State<OnboardingImageItemWidget> createState() =>
      _OnboardingImageItemWidgetState();
}

class _OnboardingImageItemWidgetState extends State<OnboardingImageItemWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  );

  late final Animation<double> _animationDouble = Tween<double>(
    begin: 0,
    end: 1,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInCirc,
  ));

  late final Animation<AlignmentDirectional> _animationAlignment =
      Tween<AlignmentDirectional>(
    begin: AlignmentDirectional.topStart,
    end: AlignmentDirectional.bottomEnd,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInCirc,
  ));

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0),
                Colors.black.withOpacity(0),
                Colors.black,
              ],
            ),
          ),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: AnimatedBuilder(
              animation: _animationDouble,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                    -(constraints.maxWidth * .3) * (1 - _animationDouble.value),
                    -(constraints.maxWidth * .3) * (1 - _animationDouble.value),
                  ),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: _animationDouble.isCompleted ? 1 : .4,
                    child: Container(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          constraints.maxHeight * (1 - _animationDouble.value),
                        ),
                      ),
                      child: Image.asset(
                        widget.image,
                        alignment: _animationAlignment.value,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
