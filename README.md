# whats_new

Beautiful way to showcase new features of your app.

[![pub package](https://img.shields.io/pub/v/whats_new.svg)](https://pub.dartlang.org/packages/whats_new)

![](https://media.giphy.com/media/7zutHtagBM6rlTknu2/giphy.gif)

## Getting Started

Add the dependency to your `pubspec.yaml`

```yaml
dependencies:
 whats_new: ^0.0.4
```

And run `flutter packages upgrade`

## How to use

### Option 1 

Use `WhatsNew.show(BuildContext, WhatsNewContent)`.

````dart
// Only show partial configurations, please refer WhatsNewContent to view more configurations
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
or
### Option 2

Created your own `WhatsNewContent` and launch with your own `Navigator`.

````dart
var content = WhatsNewContent(...)

Navigator.of(context).push(WhatsNew(content));
````

## Example

Check out the [example](https://pub.dartlang.org/packages/whats_new#-example-tab-) for more details.

## Changelog

See [changelog](https://pub.dartlang.org/packages/whats_new#-changelog-tab-).

## Contributions

Any contribution is more than welcome! You can contribute through pull requests and issues on GitHub.
