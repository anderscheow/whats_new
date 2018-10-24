import 'package:flutter/material.dart';
import 'package:whats_new/whats_new_content.dart';

class WhatsNew extends ModalRoute<void> {
  static void show(BuildContext context, WhatsNewContent content) {
    Navigator.of(context).push(WhatsNew(content));
  }

  final WhatsNewContent content;

  WhatsNew(this.content);

  @override
  Duration get transitionDuration => this.content.transitionDuration;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => this.content.dismissible;

  @override
  Color get barrierColor => this.content.backgroundColor;

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    // This makes sure that text and other content follows the material style
    return Material(
      type: MaterialType.transparency,
      // make sure that the overlay content is not cut off
      child: SafeArea(
        child: this.content,
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
