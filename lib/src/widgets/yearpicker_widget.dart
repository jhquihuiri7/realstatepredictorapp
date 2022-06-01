import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YearPickerWidget extends StatefulWidget {

  const YearPickerWidget({Key? key}) : super(key: key);

  @override
  State<YearPickerWidget> createState() => _YearPickerWidgetState();
}

class _YearPickerWidgetState extends State<YearPickerWidget> {
  int currentYear =  DateTime.now().year;
  int selectedYear = DateTime.now().year;
  @override
  Widget build(BuildContext context) {
    List<int> list= List<int>.generate(50, (index) => index+currentYear-49).reversed.toList();
    return ListTile(
      trailing: Icon(Icons.timer),
      title: Container(
        margin: EdgeInsets.symmetric(vertical:10),
        height:45,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.deepOrange,
          ),
            onPressed: (){
              showCupertinoDialog(
                  context: context,
                  builder: (_){
                    return Container(
                      color: Colors.white,
                      child: CupertinoPicker(
                          itemExtent: 70,
                          onSelectedItemChanged: (index){
                            selectedYear = list[index];
                            setState(() {

                            });

                          },
                          children: list.map((e) => Center(child: Text("$e"))).toList(),
                      ),
                    );
                  });
            }, child: Text("$selectedYear")),
      ),
    );
  }
}
