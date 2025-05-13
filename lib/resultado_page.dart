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
        backgroundColor: Color(resultado['cor']),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(resultado['cor']),
                  width: 4,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    imc.toStringAsFixed(1),
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Color(resultado['cor']),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Classificação: ${resultado['classificacao']}',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Color(resultado['cor']),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    resultado['mensagem'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(resultado['cor']),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text(
              'Calcular novamente',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
} 