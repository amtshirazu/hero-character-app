import 'package:flutter/material.dart';
import '../models/characters.dart';

class Heart extends StatefulWidget {
  const Heart({super.key, required this.character});

  final Character character;

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _sizeAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _sizeAnimation = TweenSequence([
      TweenSequenceItem<double>(
        tween: Tween(begin: 30.0, end: 45.0),
        weight: 50,
      ),

      TweenSequenceItem<double>(
        tween: Tween(begin: 45.0, end: 30),
        weight: 50,
      ),
    ]).animate(_controller);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return IconButton(
          onPressed: () {
              _controller.isCompleted ? _controller.reverse() : _controller.forward();
              widget.character.toggleIsFav();
          },
          icon: Icon(
            Icons.favorite,
            color: widget.character.fav ? Colors.red : Colors.grey[800],
            size: _sizeAnimation.value,
          ),
        );
      },
    );
  }
}
