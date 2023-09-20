class StateImc{
  String state = '';
  String interpretStatusImc(double imc) {
    if (imc < 16) {
      state = "Magreza grave";
    } else if (imc >= 16 && imc < 17) {
      state = "Magreza moderada";
    } else if (imc >= 17 && imc < 18.5) {
      state = "Magreza leve";
    } else if (imc >= 18.5 && imc < 25) {
      state = "Saudável";
    } else if (imc >= 25 && imc < 30) {
      state = "Sobrepeso";
    } else if (imc >= 30 && imc < 35) {
      state = "Obsidade Grau 1";
    } else if (imc >= 35 && imc < 40) {
      state = "Obsidade Grau 2 (severa)";
    } else if (imc >= 40) {
      state = "Obsidade Grau 3 (morbida)";
    }
    return state; 
  }
}