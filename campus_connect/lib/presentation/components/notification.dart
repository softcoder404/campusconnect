import 'package:bot_toast/bot_toast.dart';
import 'package:campus_connect/presentation/components/custom_loading.dart';
import 'package:flutter/material.dart';

enum NotificationType { success, info, error }

class TCNotification extends StatefulWidget {
  final CancelFunc? cancelFunc;
  final String? content;
  final Widget? action;
  final NotificationType? type;
  final bool showClose;

  const TCNotification({
    this.cancelFunc,
    this.action,
    this.type = NotificationType.success, // 1: success, 2: info, 3: error
    this.showClose = true,
    this.content = '',
  });

  TCNotification.info(
      {this.cancelFunc, this.content, this.action, required this.showClose})
      : type = NotificationType.info;

  TCNotification.error(
      {this.cancelFunc, this.content, this.action, required this.showClose})
      : type = NotificationType.error;

  @override
  _TCNotificationState createState() => _TCNotificationState();
}

class _TCNotificationState extends State<TCNotification> {
  Color color = Colors.teal;

  @override
  void initState() {
    super.initState();

    if (widget.type == NotificationType.info) {
      color = Colors.white;
    } else if (widget.type == NotificationType.error) {
      color = Color(0xff000000);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Row(
        children: <Widget>[
          SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Text(
                '${widget.content ?? ''}',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: widget.type == NotificationType.info
                        ? Colors.black
                        : Colors.white),
              ),
            ),
          ),
          if (widget.action != null)
            widget.action!
          else if (widget.showClose)
            IconButton(
              icon: Icon(Icons.cancel),
              color: widget.type == NotificationType.info
                  ? Colors.black
                  : Colors.white,
              onPressed: widget.cancelFunc,
            ),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}

notifySuccess({
  required String content,
  Widget? action,
  Duration duration = const Duration(seconds: 4),
  bool persist = false,
  bool showClose = true,
}) =>
    BotToast.showCustomNotification(
      toastBuilder: (cancel) {
        return TCNotification(
          cancelFunc: cancel,
          content: content,
          showClose: showClose,
          action: action,
        );
      },
      duration: persist ? Duration(days: 1000) : duration,
    );

notifyInfo({
  required String content,
  Widget? action,
  Color? color,
  Duration duration = const Duration(seconds: 4),
  bool persist = false,
  bool showClose = true,
}) =>
    BotToast.showCustomNotification(
      toastBuilder: (cancel) {
        return TCNotification.info(
          cancelFunc: cancel,
          content: content,
          showClose: showClose,
          action: action,
        );
      },
      duration: persist ? Duration(days: 1000) : duration,
    );

notifyError({
  required String content,
  Widget? action,
  Duration duration = const Duration(seconds: 4),
  bool persist = false,
  bool showClose = true,
}) =>
    BotToast.showCustomNotification(
      toastBuilder: (cancel) {
        return TCNotification.error(
          cancelFunc: cancel,
          content: content,
          showClose: showClose,
          action: action,
        );
      },
      duration: persist ? Duration(days: 1000) : duration,
    );

hideNotifications() => BotToast.cleanAll();

showLoading() => BotToast.showLoading();

hideLoading() => BotToast.closeAllLoading();
showCustomLoading({String title = 'Loading...'}) =>
    showAnimationLoading(title: title);
