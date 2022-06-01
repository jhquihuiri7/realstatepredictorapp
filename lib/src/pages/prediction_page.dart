import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realstatepredicter/src/Models/predict_model.dart';
import 'package:realstatepredicter/src/providers/label_provider.dart';
import 'package:realstatepredicter/src/services/predict_request.dart';
import 'package:realstatepredicter/src/widgets/slider_widget.dart';
import 'package:realstatepredicter/src/widgets/text_widget.dart';
import 'package:realstatepredicter/src/widgets/textfield_widget.dart';
import 'package:realstatepredicter/src/widgets/yearpicker_widget.dart';


class PredictionPage extends StatefulWidget {
  const PredictionPage({Key? key}) : super(key: key);
  @override
  State<PredictionPage> createState() => _PredictionPageState();
}
class _PredictionPageState extends State<PredictionPage> {
  final TextEditingController secondFloorController = TextEditingController();
  final TextEditingController basementAreaController = TextEditingController();
  final TextEditingController firstFloorController = TextEditingController();
  final TextEditingController garageAreaController = TextEditingController();
  final TextEditingController totalBasementController = TextEditingController();
  final TextEditingController groundAreaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final labels = ["Muy Pobre", "Pobre","Fair","Debajo del Dromedio","Promedio","Sobre el Promedio","Bueno","Muy Bueno","Excelente","Muy Excelente"];
    final screen = MediaQuery.of(context).size;
    return Consumer(
      builder: (context, ref, _){
        final labelProv = ref.watch(labelProvider);
        return Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepPurpleAccent,
            onPressed: () async{
              PredictModel model = PredictModel(
                  secondFlrSF: int.parse(secondFloorController.text),
                  bsmtFinSF: int.parse(basementAreaController.text),
                  garageYrBlt: DateTime.now().year - labelProv.yearGarage,
                  firstFlrSF: int.parse(firstFloorController.text),
                  garageArea: int.parse(garageAreaController.text),
                  totalBsmtSF: int.parse(totalBasementController.text),
                  yearBuilt: DateTime.now().year - labelProv.yearBuilt,
                  garageCars: labelProv.garageCapacity.toInt(),
                  grLivArea: int.parse(groundAreaController.text),
                  overallQual: labelProv.quality.toInt()
              );
              showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      content: FutureBuilder(
                        future: PredictRequest().getPrediction(model),
                        builder: (context, snapshot){
                          if(snapshot.hasData){
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextWidget(text: "El valor de la casa de tus sueños es:", style: "subtitle"),
                                TextWidget(text: "\$${snapshot.data}", style: "title",)
                              ]
                            );
                          }else{
                            return Container(width: 30, height:30, child: Center(child: CircularProgressIndicator()));
                          }
                        },
                      ),
                    );
                  }
              );

            },
            child: Icon(Icons.monetization_on_rounded, size: 40,),
          ),
          body: SafeArea(
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 80),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            margin: EdgeInsets.only(bottom: 20),
                            height: screen.width / 3,
                            child: SvgPicture.asset("assets/predicticon.svg")
                        ),
                        TextFieldWidget(icon: Icons.extension, title: "Segunda Planta", controller: secondFloorController,),
                        TextFieldWidget(icon: Icons.pages, title: "Base Terminada", controller: basementAreaController,),
                        TextWidget(text: "Año Construcción de Garage", style: "form"),
                        YearPickerWidget(),
                        TextFieldWidget(icon: Icons.arrow_downward, title: "Planta Baja", controller: firstFloorController,),
                        TextFieldWidget(icon: Icons.add_road, title: "Area Garage", controller: garageAreaController,),
                        TextFieldWidget(icon: Icons.home, title: "Base Total", controller: totalBasementController,),
                        TextWidget(text: "Año Construcción de Vivienda", style: "form"),
                        YearPickerWidget(),
                        TextWidget(text: "Capacidad de Garage (Número Carros)", style: "form"),
                        SliderWidget(value: 2, min: 1, max: 10, type: "value", labels: labels,),
                        TextFieldWidget(icon: Icons.height, title: "Area del Garage", controller: groundAreaController,),
                        TextWidget(text: "Estado de la Vivienda", style: "form"),
                        SliderWidget(value: 2, min: 1, max: 10, type: "label", labels: labels,),
                      ]
                  ),
                ),
              )
          ),
        );
      },
    );
  }
}
