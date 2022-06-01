import 'dart:convert';

class PredictModel {
  final int secondFlrSF;
  final int bsmtFinSF;
  final int garageYrBlt;
  final int firstFlrSF;
  final int garageArea;
  final int totalBsmtSF;
  final int yearBuilt;
  final int garageCars;
  final int grLivArea;
  final int overallQual;

  PredictModel({
      required this.secondFlrSF,
      required this.bsmtFinSF,
      required this.garageYrBlt,
      required this.firstFlrSF,
      required this.garageArea,
      required this.totalBsmtSF,
      required this.yearBuilt,
      required this.garageCars,
      required this.grLivArea,
      required this.overallQual
  });

  String toJson() => json.encode({
    "secondFlrSF": secondFlrSF,
    "bsmtFinSF": bsmtFinSF,
    "garageYrBlt": garageYrBlt,
    "firstFlrSF": firstFlrSF,
    "garageArea": garageArea,
    "totalBsmtSF": totalBsmtSF,
    "yearBuilt": yearBuilt,
    "garageCars": garageCars,
    "grLivArea": grLivArea,
    "overallQual": overallQual,
  });

}

