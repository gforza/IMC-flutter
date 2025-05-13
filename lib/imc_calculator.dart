class ImcCalculator {
  static double calcularIMC(double peso, double altura) {
    return peso / (altura * altura);
  }

  static Map<String, String> interpretarIMC(double imc) {
    if (imc < 18.5) {
      return {'classificacao': 'Magreza', 'grau': '0'};
    } else if (imc < 25) {
      return {'classificacao': 'Normal', 'grau': '0'};
    } else if (imc < 30) {
      return {'classificacao': 'Sobrepeso', 'grau': '1'};
    } else if (imc < 40) {
      return {'classificacao': 'Obesidade', 'grau': '2'};
    } else {
      return {'classificacao': 'Obesidade Grave', 'grau': '3'};
    }
  }
} 