import 'package:imc/controller.dart';
import 'package:imc/person.dart';
import 'package:test/test.dart';

void main() {
  test('controller correto', () {
    Controller controller = Controller();
    String result = controller.imc(Person(weight: 97, height: 1.8, name: 'vitor',));
    expect(result, 'Sobrepeso');
  });
}