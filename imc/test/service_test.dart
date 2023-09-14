import 'package:imc/service.dart';
import 'package:test/test.dart';

void main() {
  test('service correto', () {
    Service service = Service();
    double value = service.calculateImc(97, 1.80);
    expect(double.parse(value.toStringAsFixed(1)), 29.9);
  });
}