part of animated_collection;

///AnimatedRotate
class AnimatedRotate extends ImplicitlyAnimatedWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;
  final double angle;

  AnimatedRotate({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 400),
    this.curve = Curves.easeInOutCubic,
    required this.angle,
  }) : super(
          key: key,
          duration: duration,
          curve: curve,
        );
  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
      _AnimatedRoateState();
}

class _AnimatedRoateState extends AnimatedWidgetBaseState<AnimatedRotate> {
  Tween<double>? _rotateTween;

  @override
  Widget build(BuildContext context) {
    // return AnimatedOpacity()
    return Transform.rotate(
      angle: _rotateTween?.evaluate(animation) ?? 0,
      child: widget.child,
    );
  }

  @override
  void forEachTween(visitor) {
    _rotateTween = visitor(
      _rotateTween,
      widget.angle,
      (dynamic value) => Tween<double>(begin: value),
    ) as Tween<double>?;
  }
}
