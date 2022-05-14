import 'package:flutter/widgets.dart';

/// A Widget which makes its child bounce up and down.
class Bouncy extends StatefulWidget {
  /// total duration of the bounce cycle, including pause
  Duration duration;

  /// how high to lift before dropping
  double lift;

  /// ratio of the cycle which should be inactive (between 0 and 1)
  double pause;

  /// ratio of lift to drop phases
  double ratio;

  /// the Widget which will bounce
  Widget child;

  Bouncy(
      {this.duration = const Duration(seconds: 1),
      required this.lift,
      this.pause = 0,
      this.ratio = 0.25,
      required this.child});

  @override
  _BouncyState createState() => _BouncyState();
}

class _BouncyState extends State<Bouncy> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return _BouncyAnimation(
        controller: _controller,
        lift: widget.lift,
        pause: widget.pause,
        ratio: widget.ratio,
        child: widget.child);
  }
}

class _BouncyAnimation extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> upPhase;
  final Animation<double> downPhase;
  final Animation<double> pausePhase;
  final double ratio;
  final double lift;
  final double pause;
  final Widget child;

  _BouncyAnimation(
      {required this.controller,
      required this.lift,
      required this.pause,
      required this.ratio,
      required this.child,
      super.key})
      : upPhase = Tween<double>(begin: 0.0, end: lift).animate(CurvedAnimation(
            parent: controller, curve: Interval(0.0, ratio * (1 - pause)))),
        downPhase = Tween<double>(begin: lift, end: 0).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(ratio * (1 - pause), (1.0 - pause),
                curve: Curves.bounceOut))),
        pausePhase = Tween<double>(begin: 0, end: 0).animate(
            CurvedAnimation(parent: controller, curve: Interval(1 - pause, 1)));

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Padding(
        padding: EdgeInsets.only(bottom: upPhase.value + downPhase.value),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller, builder: _buildAnimation, child: child);
  }
}
