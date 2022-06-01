
import 'dart:convert';

import 'package:realstatepredicter/src/Models/predict_model.dart';
import 'package:http/http.dart' as http;

class PredictRequest {
  Uri url = Uri.parse("https://realstatepredictor.herokuapp.com/predict");
  Future<int> getPrediction(PredictModel model) async {
    http.Response response = await http.post(url, headers: {"Content-Type": "application/json","Accept": "application/json"}, body: model.toJson());
    return json.decode(response.body)["salePrice"];
  }
}