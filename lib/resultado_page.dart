import 'package:flutter/material.dart';
import 'imc_calculator.dart';

class ResultadoPage extends StatelessWidget {
  final double imc;

  const ResultadoPage({super.key, required this.imc});

  @override
  Widget build(BuildContext context) {
    final resultado = ImcCalculator.interpretarIMC(imc);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado do IMC'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Seu IMC é: ${imc.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              Text(
                'Classificação: ${resultado['classificacao']}',
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 12),
              Text(
                'Obesidade (grau): ${resultado['grau']}',
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Calcular novamente'),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 