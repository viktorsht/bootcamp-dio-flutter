import 'package:flutter/material.dart';

import '../controller/imc_controller.dart';
import '../model/imc_model.dart';
import '../model/person_model.dart';

class ImcPage extends StatefulWidget {
  final String title;
  const ImcPage({super.key, required this.title});

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  
  final controller = ImcController();
  ImcModel body = ImcModel.empty();
  String state = '';

  final _formKey = GlobalKey<FormState>();
  FormState get form => _formKey.currentState!;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
/*
  @override
  void dispose() {
    nameController.dispose();
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {  
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                    decoration: const InputDecoration(labelText: 'Nome'),
                    keyboardType: TextInputType.name,
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira um nome.';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Altura'),
                    keyboardType: TextInputType.number,
                    controller: heightController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira uma altura.';
                      }
                      final double heightValue = double.tryParse(value) ?? 0.0;
                      if (heightValue <= 0) {
                        return 'Altura deve ser maior que zero.';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Peso'),
                    keyboardType: TextInputType.number,
                    controller: weightController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira um endereço.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final valid = form.validate();
                      if (valid) {
                        final imc = controller.imc(PersonModel(
                          name: nameController.text, 
                          weight: double.parse(weightController.text), 
                          height: double.parse(heightController.text),
                          )
                        );
                        setState(() {
                          state = controller.state.interpretStatusImc(imc.value);
                          body = imc;
                        });
                      }
                    },
                    child: const Text('Enviar'),
                  ),
                  const SizedBox(height: 18),
                state != '' 
                ? Center(
                  child: Column(
                    children: [
                      Text(
                        "${body.person.name}, seu IMC é ${body.toString()}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "Seu estado é $state",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                )
                : Container(),
              ],
            ),
          ),
        ),
    );
  }
}