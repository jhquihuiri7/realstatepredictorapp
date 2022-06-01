import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final TextEditingController controller;
  const TextFieldWidget({required this.icon, required this.title,required this.controller, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        controller: controller,
        decoration: InputDecoration(
          labelText: title,
          icon: Icon(icon),
          suffix: Text("m²", style: TextStyle(fontWeight: FontWeight.bold),),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15)
          ),
        ),

      ),
    );
  }
}
