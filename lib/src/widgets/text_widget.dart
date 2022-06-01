import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final String style;
  TextWidget({required this.text, required this.style, key}) : super(key: key);

  TextStyle title = const TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.black54,
  );
  TextStyle subtitle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.black45,
  );
  TextStyle form = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: Colors.black45,
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 0),
      child: Text(text, style: (style == "title") ? title : (style == "subtitle") ? subtitle : form,),
    );
  }
}
