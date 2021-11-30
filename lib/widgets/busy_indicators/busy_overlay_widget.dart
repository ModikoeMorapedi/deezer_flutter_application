import 'package:deezer_flutter_application/utils/enums/view_state_enum.dart';
import 'package:flutter/material.dart';

class BusyOverlayWidget extends StatelessWidget {
  final Widget child;
  final String title;
  final bool show;
  final ViewState state;
  final Color color;
  final Color textColor;
  final Color progressColor;
  const BusyOverlayWidget(
      {this.child,
      this.title = 'Please wait ...',
      this.show = false,
      this.state,
      this.color,
      this.textColor,
      this.progressColor});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Material(
      child: Stack(
        children: <Widget>[
          child,
          IgnorePointer(
            child: Opacity(
                opacity: show ? 1.0 : 0.0,
                child: Container(
                  width: screenSize.width,
                  height: screenSize.height,
                  alignment: Alignment.center,
                  color: color ?? Color.fromARGB(100, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CircularProgressIndicator(
                        color: progressColor ?? Colors.blue,
                      ),
                      Text(title,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: textColor ?? Colors.white)),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
