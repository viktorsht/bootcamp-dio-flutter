import 'dart:io';

import 'package:imc/controller.dart';
import 'package:imc/person.dart';

void main() {
  final controller = Controller();
  print("Calculadora de IMC");
  print("Digite seu nome:");
  String? nome = stdin.readLineSync();

  double? peso;
  double? altura;

  try {
    print("Digite seu peso (em quilogramas):");
    peso = double.parse(stdin.readLineSync()!);

    print("Digite sua altura (em metros):");
    altura = double.parse(stdin.readLineSync()!);

    final body = Person(height: altura, weight: peso, name: nome!);
    String resultImc = controller.imc(body);

    print("\nResultado para $nome:");
    print("Peso: $peso kg");
    print("Altura: $altura m");
    print("IMC: $resultImc");
  } catch (e) {
    print("Ocorreu um erro durante a entrada de dados. Certifique-se de inserir números válidos para peso e altura.");
  }
}


