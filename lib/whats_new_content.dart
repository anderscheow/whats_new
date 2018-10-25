import 'package:flutter/material.dart';
import 'package:whats_new/util.dart';

abstract class WhatsNewCallback {
  void onWhatsNewShowed();
  void onWhatsNewDismissed();
  void onPrimaryButtonClicked();
  void onSecondaryButtonClicked();
}

class Feature {
  final String icon;
  final Color iconColor;
  final String title;
  final Color titleColor;
  final double titleFontSize;
  final FontWeight titleFontWeight;
  final String description;
  final Color descriptionColor;
  final double descriptionFontSize;
  final FontWeight descriptionFontWeight;

  Feature({
    @required this.icon,
    @required this.iconColor,
    @required this.title,
    @required this.titleColor,
    @required this.description,
    @required this.descriptionColor,
    this.titleFontSize = 16.0,
    this.titleFontWeight = FontWeight.w600,
    this.descriptionFontSize = 16.0,
    this.descriptionFontWeight = FontWeight.normal,
  }) : assert(icon != null),
       assert(iconColor != null),
       assert(title != null),
       assert(titleColor != null),
       assert(titleFontSize != null),
       assert(titleFontWeight != null),
       assert(description != null),
       assert(descriptionColor != null),
       assert(descriptionFontSize != null),
       assert(descriptionFontWeight != null);
}

class WhatsNewContent extends StatefulWidget {
  final Color backgroundColor;
  final String title;
  final Color titleColor;
  final double titleFontSize;
  final FontWeight titleFontWeight;
  final String primaryButtonText;
  final Color primaryButtonTextColor;
  final Color primaryButtonBackgroundColor;
  final double primaryButtonFontSize;
  final FontWeight primaryButtonFontWeight;
  final String secondaryButtonText;
  final Color secondaryButtonTextColor;
  final double secondaryButtonFontSize;
  final FontWeight secondaryButtonFontWeight;
  final bool hideSecondaryButton;
  final WhatsNewCallback callback;
  final Duration transitionDuration;
  final Duration featureItemTransitionDuration;
  final bool dismissible;
  final List<Feature> features;

  WhatsNewContent({
    @required this.backgroundColor,
    @required this.title,
    @required this.titleColor,
    @required this.primaryButtonText,
    @required this.primaryButtonTextColor,
    @required this.primaryButtonBackgroundColor,
    @required this.secondaryButtonText,
    @required this.secondaryButtonTextColor,
    @required this.features,
    this.titleFontSize = 24.0,
    this.titleFontWeight = FontWeight.w600,
    this.primaryButtonFontSize = 18.0,
    this.primaryButtonFontWeight = FontWeight.normal,
    this.secondaryButtonFontSize = 16.0,
    this.secondaryButtonFontWeight = FontWeight.normal,
    this.hideSecondaryButton = false,
    this.callback,
    this.transitionDuration = const Duration(milliseconds: 350),
    this.featureItemTransitionDuration = const Duration(milliseconds: 350),
    this.dismissible = false,
  })  : assert(backgroundColor != null),
        assert(title != null),
        assert(titleColor != null),
        assert(titleFontSize != null),
        assert(titleFontWeight != null),
        assert(primaryButtonText != null),
        assert(primaryButtonTextColor != null),
        assert(primaryButtonBackgroundColor != null),
        assert(primaryButtonFontSize != null),
        assert(primaryButtonFontWeight != null),
        assert(secondaryButtonText != null),
        assert(secondaryButtonTextColor != null),
        assert(secondaryButtonFontSize != null),
        assert(secondaryButtonFontWeight != null),
        assert(features != null),
        assert(hideSecondaryButton != null),
        assert(transitionDuration != null),
        assert(dismissible != null);

  @override
  WhatsNewContentState createState() {
    return new WhatsNewContentState();
  }
}

class WhatsNewContentState extends State<WhatsNewContent> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  ListModel<Feature> _features;

  @override
  void initState() {
    super.initState();
    this._features = ListModel<Feature>(
      listKey: _listKey,
      initialItems: [],
      removedItemBuilder: null,
    );
  }

  @override
  Widget build(BuildContext context) {
    this.widget.callback?.onWhatsNewShowed();

    List<Widget> contents = [];
    contents.add(this._titleLayout(context));
    contents.add(this._featuresLayout(context));
    if (!this.widget.hideSecondaryButton) {
      contents.add(this._actionsLayout(context));
    }

    if (this.widget.features.length > 0) {
      this.iterateAndAddFeatures(0);
    }

    return new Scaffold(
      body: new Container(
        color: this.widget.backgroundColor,
        child: new SafeArea(
            child: new Container(
          padding: EdgeInsets.all(16.0),
          child: new Column(
            children: contents,
          ),
        )),
      ),
    );
  }

  void iterateAndAddFeatures(int index) async {
    if (index <= this.widget.features.length - 1) {
      Future.delayed(this.widget.featureItemTransitionDuration, () {
        this
            ._features
            .insert(this._features.length, this.widget.features[index]);
        this.iterateAndAddFeatures(index + 1);
      });
    }
  }

  Widget _titleLayout(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
      child: Text(
        this.widget.title,
        style: Theme.of(context).textTheme.display1.copyWith(
          color: this.widget.titleColor,
          fontWeight: this.widget.titleFontWeight,
          fontSize: this.widget.titleFontSize,
        ),
        maxLines: 3,
      ),
    );
  }

  Widget _featuresLayout(BuildContext context) {
    return new Expanded(
        flex: 4,
        child: new Container(
          margin:
              EdgeInsets.only(left: 4.0, top: 16.0, right: 4.0, bottom: 16.0),
          child: new ScrollConfiguration(
            behavior: DisableGlowScrollBehavior(),
            child: AnimatedList(
                key: this._listKey,
                initialItemCount: this._features.length,
                itemBuilder: (context, index, animation) {
                  return this._featureLayout(
                      context, this._features[index], animation);
                }),
          ),
        ));
  }

  Widget _featureLayout(
      BuildContext context, Feature feature, Animation<double> animation) {
    return new Container(
      child: SizeTransition(
        sizeFactor: animation,
        child: ListTile(
          isThreeLine: true,
          enabled: false,
          leading: Image.asset(
            feature.icon,
            color: feature.iconColor,
            width: 40.0,
            height: 40.0,
          ),
          title: Text(
            feature.title,
            style: Theme.of(context).textTheme.subhead.copyWith(
              color: feature.titleColor,
              fontSize: feature.titleFontSize,
              fontWeight: feature.titleFontWeight,
            ),
            maxLines: 2,
          ),
          subtitle: Text(
            feature.description,
            style: Theme.of(context).textTheme.subhead.copyWith(
              color: feature.descriptionColor,
              fontSize: feature.descriptionFontSize,
              fontWeight: feature.descriptionFontWeight,
            ),
            maxLines: 5,
          ),
        ),
      ),
    );
  }

  Widget _actionsLayout(BuildContext context) {
    return new Expanded(
        child: new Container(
      alignment: Alignment.bottomCenter,
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Container(
            padding:
                EdgeInsets.only(left: 8.0, top: 4.0, right: 8.0, bottom: 4.0),
            margin: EdgeInsets.only(bottom: 16.0),
            child: GestureDetector(
              onTap: () {
                this.widget.callback?.onSecondaryButtonClicked();
              },
              child: Text(
                this.widget.secondaryButtonText,
                style: Theme.of(context).textTheme.body1.copyWith(
                  color: this.widget.secondaryButtonTextColor,
                  fontSize: this.widget.secondaryButtonFontSize,
                  fontWeight: this.widget.secondaryButtonFontWeight
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: RaisedButton(
              onPressed: () {
                this.widget.callback?.onPrimaryButtonClicked();
                this.widget.callback?.onWhatsNewDismissed();
                Navigator.of(context).pop();
              },
              child: Text(
                this.widget.primaryButtonText,
                style: Theme.of(context).textTheme.subhead.copyWith(
                  color: this.widget.primaryButtonTextColor,
                  fontSize: this.widget.primaryButtonFontSize,
                  fontWeight: this.widget.primaryButtonFontWeight
                ),
              ),
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: this.widget.primaryButtonBackgroundColor),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              color: this.widget.primaryButtonBackgroundColor,
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            ),
          ),
        ],
      ),
    ));
  }
}
