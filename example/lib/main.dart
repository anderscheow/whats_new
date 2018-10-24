import 'package:flutter/material.dart';
import 'package:whats_new/whats_new.dart';
import 'package:whats_new/whats_new_content.dart';

// Example application:
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Playground',
      home: TestPage(),
    );
  }
}

class TestPage extends StatelessWidget implements WhatsNewCallback {
  void _showOverlay(BuildContext context) {
    WhatsNew.show(context, WhatsNewContent(
      backgroundColor: Colors.white,
      title: 'What\'s New',
      titleColor: Colors.black,
      primaryButtonText: 'Let\'s Go',
      primaryButtonTextColor: Colors.white,
      primaryButtonBackgroundColor: Colors.red,
      secondaryButtonText: 'Learn more',
      secondaryButtonTextColor: Colors.red,
      transitionDuration: Duration(milliseconds: 350),
      featureItemTransitionDuration: Duration(milliseconds: 350),
      features: [
        Feature(
          icon: 'assets/access-point.png',
          iconColor: Colors.red,
          title: 'Title one',
          titleColor: Colors.black,
          description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          descriptionColor: Colors.grey
        ),
        Feature(
            icon: 'assets/account.png',
            iconColor: Colors.red,
            title: 'Title two',
            titleColor: Colors.black,
            description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
            descriptionColor: Colors.grey
        ),
        Feature(
            icon: 'assets/alert-circle.png',
            iconColor: Colors.red,
            title: 'Title three',
            titleColor: Colors.black,
            description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
            descriptionColor: Colors.grey
        ),
        Feature(
            icon: 'assets/camera-iris.png',
            iconColor: Colors.red,
            title: 'Title four',
            titleColor: Colors.black,
            description: 'Lorem ipsum dolor sit amet',
            descriptionColor: Colors.grey
        ),
        Feature(
            icon: 'assets/cellphone.png',
            iconColor: Colors.red,
            title: 'Title five',
            titleColor: Colors.black,
            description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
            descriptionColor: Colors.grey
        )
      ],
    ));
  }

  @override
  void onWhatsNewShowed() {
    print('onWhatsNewShowed');
  }

  @override
  void onWhatsNewDismissed() {
    print('onWhatsNewDismissed');
  }

  @override
  void onPrimaryButtonClicked() {
    print('onPrimaryButtonClicked');
  }

  @override
  void onSecondaryButtonClicked() {
    print('onSecondaryButtonClicked');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('flutter_whats_new_example')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: RaisedButton(
            onPressed: () => _showOverlay(context),
            child: Text('Show WhatsNew'),
          ),
        ),
      ),
    );
  }
}