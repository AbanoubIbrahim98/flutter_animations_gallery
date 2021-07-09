import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animations_gallery/animation_controller_state.dart';
import 'package:flutter_animations_gallery/gallery_navigation/page_scaffold.dart';

class RotationTransitionPage extends StatefulWidget {
  const RotationTransitionPage({Key? key}) : super(key: key);

  @override
  _RotationTransitionPageState createState() =>
      _RotationTransitionPageState(Duration(milliseconds: 1000));
}

class _RotationTransitionPageState
    extends AnimationControllerState<RotationTransitionPage> {
  _RotationTransitionPageState(Duration duration) : super(duration);
  bool _isAnimating = false;

  void _toggleAnimation() {
    if (_isAnimating) {
      animationController.stop();
    } else {
      animationController.repeat();
    }
    setState(() => _isAnimating = !_isAnimating);
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'RotationTransition',
      actions: [
        IconButton(
          icon: Icon(_isAnimating ? Icons.pause : Icons.play_arrow),
          onPressed: _toggleAnimation,
        ),
      ],
      body: Center(
        child: GestureDetector(
          onTap: _toggleAnimation,
          child: RotationTransition(
            turns: animationController,
            child: Container(
              width: 240,
              height: 240,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}

// Something that is not scale, rotate, or translate.
// class RotatingContainer extends AnimatedWidget {
//   RotatingContainer({Key? key, required Animation<double> animation})
//       : super(key: key, listenable: animation);

//   Animation<double> get animation => listenable as Animation<double>;

//   @override
//   Widget build(BuildContext context) {
//     return Transform.rotate(
//       angle: 0.5 * pi * animation.value,
//       child: Container(
//         width: 240,
//         height: 240,
//         color: Theme.of(context).primaryColor,
//       ),
//     );
//   }
// }