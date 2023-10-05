import 'package:flutter/material.dart';

import '../model/imc_model.dart';
import '../model/person_model.dart';
import '../service/imc_service.dart';
import '../state.dart';
import 'shared_pref_imc.dart';

class ImcController extends ChangeNotifier{

  StateImc state = StateImc();
  ImcService service = ImcService();
  final iMCSharedPreferences = IMCSharedPreferences();

  ImcModel imc(PersonModel body){
    double imc = service.calculateImc(body.weight, body.height);
    iMCSharedPreferences.salvarIMC(imc);
    notifyListeners();
    return ImcModel(imc: imc, person: body);
  }

  String imcState(double value){
    String status = state.interpretStatusImc(value); 
    notifyListeners();
    return status;
  }
}