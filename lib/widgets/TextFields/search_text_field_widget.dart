import 'package:deezer_flutter_application/utils/views_utils/strings_utils.dart';
import 'package:flutter/material.dart';

class SearchTextFieldWidget extends StatelessWidget {
  final FormFieldSetter<String> onChanged;
  final String hintText;
  const SearchTextFieldWidget({Key key, this.onChanged, this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 10),
        hintText: hintText ?? StringsUtils.search,
        filled: true,
        fillColor: Colors.grey[600],
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.blueGrey[200]),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.blueGrey[200]),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.blueGrey[200]),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(
              color: Colors.blueGrey[200],
              width: 1,
            )),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey[400],
        ),
      ),
      onChanged: onChanged,
      autofocus: false,
    );
  }
}
