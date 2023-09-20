import 'package:calculadora_imc/app/model/person_model.dart';

class ImcModel{
  final double imc;
  final PersonModel person;

  ImcModel({required this.imc, required this.person});

  double get value => double.parse(imc.toStringAsFixed(1));

  @override
  String toString() => value.toString();
  
  ImcModel.empty() : imc = 0.0, person = PersonModel(name: '', weight: 0, height: 0);
}