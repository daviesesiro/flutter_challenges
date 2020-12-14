import 'package:flutter/material.dart';

class PageWithCustomDrawer extends StatelessWidget {
  /// A Widget to display behind
  final Widget customDrawer;
  final Widget page;
  final bool showDrawer;
  final Duration duration;
  final double scaleDown;
  final double translateX;
  final Curve curve;
  final double pageBorderRadius;

  /// Creates a Page and a Custom Drawer
  ///
  /// The Page slides to the right
  PageWithCustomDrawer({
    @required this.showDrawer,
    @required this.customDrawer,
    @required this.page,
    this.duration = const Duration(milliseconds: 100),
    this.scaleDown = 0.85,
    this.translateX = 300.0,
    this.curve = Curves.fastOutSlowIn,
    this.pageBorderRadius = 60.0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: <Widget>[
          customDrawer,
          _buildPage(page),
        ],
      ),
    );
  }

  Widget _buildPage(child) {
    return AnimatedContainer(
      curve: curve,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(showDrawer ? pageBorderRadius : 0),
      ),
      duration: duration,
      transformAlignment: Alignment.center,
      transform: Matrix4.identity()
        ..scale(showDrawer ? scaleDown : 1.0)
        ..translate(showDrawer ? translateX : 0.0, 0, 100),
      child: child,
    );
  }
}
