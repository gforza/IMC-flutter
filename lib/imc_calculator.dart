class ImcCalculator {
  static double calcularIMC(double peso, double altura) {
    return peso / (altura * altura);
  }

  static Map<String, dynamic> interpretarIMC(double imc) {
    if (imc < 18.5) {
      return {
        'classificacao': 'Magreza',
        'grau': '0',
        'cor': 0xFFFFA500, // Laranja
        'mensagem': 'Você está abaixo do peso ideal. Considere consultar um nutricionista para uma dieta adequada.'
      };
    } else if (imc < 25) {
      return {
        'classificacao': 'Normal',
        'grau': '0',
        'cor': 0xFF4CAF50, // Verde
        'mensagem': 'Parabéns! Seu peso está dentro da faixa considerada normal.'
      };
    } else if (imc < 30) {
      return {
        'classificacao': 'Sobrepeso',
        'grau': '1',
        'cor': 0xFFFFC107, // Amarelo
        'mensagem': 'Você está com sobrepeso. Considere iniciar uma rotina de exercícios e ajustar sua alimentação.'
      };
    } else if (imc < 40) {
      return {
        'classificacao': 'Obesidade',
        'grau': '2',
        'cor': 0xFFFF5722, // Laranja escuro
        'mensagem': 'Você está com obesidade. É importante procurar orientação médica e nutricional.'
      };
    } else {
      return {
        'classificacao': 'Obesidade Grave',
        'grau': '3',
        'cor': 0xFFD32F2F, // Vermelho
        'mensagem': 'Você está com obesidade grave. É fundamental buscar ajuda médica imediatamente.'
      };
    }
  }
} 