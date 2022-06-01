import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realstatepredicter/src/widgets/separator_widget.dart';
import 'package:realstatepredicter/src/widgets/text_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(vertical: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextWidget(text: "Encuentra la casa de tus sueños", style: "title",),
            Container(
              height:screen.width / 1.5,
              child: SvgPicture.asset("assets/mainicon.svg", fit: BoxFit.fitWidth,)),
            TextWidget(
                text: "Identifica la casa de tus sueños y obten un precio estimado de mercado, es hora de invertir en tu futuro!",
                style: "subtitle",
            ),
            SeparationWidget(color: Colors.deepOrange,),
            Container(
              height: 50,
              width: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "prediction");
                },
                child: Icon(Icons.arrow_forward_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
