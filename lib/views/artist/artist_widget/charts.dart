import 'package:deezer_flutter_application/utils/views_utils/sizes_utils.dart';
import 'package:deezer_flutter_application/utils/views_utils/strings_utils.dart';
import 'package:flutter/material.dart';

class ChatsWidget extends StatelessWidget {
  final int itemCount;
  final String title;
  final String subTitle;
  const ChatsWidget({Key key, this.subTitle, this.itemCount, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blueGrey[200],
        padding: const EdgeInsets.only(bottom: 10),
        alignment: Alignment.bottomCenter,
        height: 150,
        width: 150,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(color: Colors.white),
              )),
          Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(subTitle,
                  style: TextStyle(
                      color: Colors.yellow,
                      fontSize: Sizes.size_14,
                      fontWeight: FontWeight.bold)))
        ]));
  }
}
