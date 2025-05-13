import 'package:flutter/material.dart';
import 'resultado_page.dart';
import 'imc_calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _calcularIMC() {
    if (_formKey.currentState!.validate()) {
      final double peso = double.parse(_pesoController.text.replaceAll(',', '.'));
      final double altura = double.parse(_alturaController.text.replaceAll(',', '.'));
      final double imc = ImcCalculator.calcularIMC(peso, altura);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultadoPage(imc: imc),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _pesoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Peso (kg)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o peso';
                  }
                  final peso = double.tryParse(value.replaceAll(',', '.'));
                  if (peso == null || peso <= 0) {
                    return 'Peso inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _alturaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Altura (m)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a altura';
                  }
                  final altura = double.tryParse(value.replaceAll(',', '.'));
                  if (altura == null || altura <= 0) {
                    return 'Altura inválida';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _calcularIMC,
                  child: const Text('Calcular IMC'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
