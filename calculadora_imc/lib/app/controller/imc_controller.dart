import 'package:calculadora_imc/app/model/imc_model.dart';
import 'package:calculadora_imc/app/model/person_model.dart';
import 'package:calculadora_imc/app/service/imc_service.dart';
import 'package:flutter/material.dart';

import '../state.dart';

class ImcController extends ChangeNotifier{

  StateImc state = StateImc();
  ImcService service = ImcService();

  ImcModel imc(PersonModel body){
    double imc = service.calculateImc(body.weight, body.height);
    notifyListeners();
    return ImcModel(imc: imc, person: body);
  }

  String imcState(double value){
    String _state = state.interpretStatusImc(value); 
    notifyListeners();
    return _state;
  }
}