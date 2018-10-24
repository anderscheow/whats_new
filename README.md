# whats_new

A Flutter plugin for Android and iOS supports cropping images

[![pub package](https://img.shields.io/pub/v/whats_new.svg)](https://pub.dartlang.org/packages/whats_new)

![](https://media.giphy.com/media/7zutHtagBM6rlTknu2/giphy.gif)

## Getting Started

````dart
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
      hideSecondaryButton: false,
      dismissible: false,
      callback: this,
      features: [
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
````

Check out the [example](https://pub.dartlang.org/packages/whats_new#-example-tab-)
