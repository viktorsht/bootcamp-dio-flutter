import 'package:imc/imc_state.dart';
import 'package:imc/service.dart';
import 'package:imc/person.dart';

class Controller{
  StateImc state = StateImc();
  Service service = Service();

  String imc(Person body){
    double imc = service.calculateImc(body.weight, body.height);
    return state.interpretStatusImc(double.parse(imc.toStringAsFixed(1)));
  }

}