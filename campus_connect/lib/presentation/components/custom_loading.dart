import 'package:bot_toast/bot_toast.dart';
import 'package:campus_connect/presentation/config/themes/colors.dart';
import 'package:campus_connect/presentation/config/themes/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class _CustomLoadWidget extends StatefulWidget {
  final CancelFunc? cancelFunc;
  final String? title;
  const _CustomLoadWidget({Key? key, this.cancelFunc, this.title})
      : super(key: key);

  @override
  __CustomLoadWidgetState createState() => __CustomLoadWidgetState();
}

class __CustomLoadWidgetState extends State<_CustomLoadWidget>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));

    animationController!.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        animationController!.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController!.forward();
      }
    });
    animationController!.forward();

    super.initState();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircularProgressIndicator(
              color: kPrimaryColor,
              backgroundColor: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "${widget.title}",
                style: kBodyText1.copyWith(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}

showAnimationLoading({
  bool clickClose = false,
  bool allowClick = false,
  int seconds = 120,
  String title = 'Loading...',
  int backgroundColor = 0xfffff,
  bool ignoreContentClick = false,
  int animationMilliseconds = 200,
  int animationReverseMilliseconds = 200,
  BackButtonBehavior backButtonBehavior = BackButtonBehavior.ignore,
}) {
  return BotToast.showCustomLoading(
      clickClose: clickClose,
      allowClick: allowClick,
      backButtonBehavior: backButtonBehavior,
      ignoreContentClick: ignoreContentClick,
      animationDuration: Duration(milliseconds: animationMilliseconds),
      animationReverseDuration:
          Duration(milliseconds: animationReverseMilliseconds),
      duration: Duration(
        seconds: seconds,
      ),
      backgroundColor: Colors.black26,
      align: Alignment.center,
      toastBuilder: (cancelFunc) {
        return _CustomLoadWidget(cancelFunc: cancelFunc, title: title);
      });
}
