import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatefulWidget {
  final double value;
  final Color color;
  CustomProgressIndicator({@required this.value, this.color = Colors.red});

  @override
  _CustomProgressIndicatorState createState() =>
      _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator>
    with AfterLayoutMixin<CustomProgressIndicator> {
  final GlobalKey _keyProgressIndicator = GlobalKey();
  Size sizeOfProgressIndicator;
  final double widthOfPointer = 4;

  _getProgressIndcatorSize() {
    setState(() {
      sizeOfProgressIndicator =
          (_keyProgressIndicator.currentContext.findRenderObject() as RenderBox)
              .size;
    });
  }

  @override
  void afterFirstLayout(BuildContext context) {
    _getProgressIndcatorSize();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        LinearProgressIndicator(
          key: _keyProgressIndicator,
          backgroundColor: Colors.grey.shade200,
          valueColor: AlwaysStoppedAnimation<Color>(widget.color),
          value: widget.value,
        ),
        if (widget.value > 0)
          Positioned(
            left: sizeOfProgressIndicator == null
                ? 200 * widget.value
                : sizeOfProgressIndicator.width * widget.value - widthOfPointer,
            bottom: 1,
            child: Container(
              height: 8,
              width: widthOfPointer,
              color: widget.color,
            ),
          ),
      ],
    );
  }
}
