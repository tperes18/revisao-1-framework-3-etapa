class Validadores {
  static String? textoObrigatorio(String? valor) {
    // (FEITO) TODO 1: rejeite null, texto vazio e texto formado apenas por espaços.
    // Retorne uma mensagem de erro ou null quando o valor for válido.
    if (valor == null || valor.trim().isEmpty) return 'Preencha o nome do material'; // [esta linha foi adicionada]
    return null;
  }

  static String? quantidade(String? valor) {
    // (FEITO) TODO 2: aceite somente inteiros maiores ou iguais a zero.
    // Não converta uma quantidade inválida para zero.
    if (valor == null) return 'Informe um número inteiro'; // [esta linha foi adicionada]

    final int? quantidade = int.tryParse(valor); // [esta linha foi adicionada]

    if (quantidade == null) return 'Informe um número inteiro'; // [esta linha foi adicionada]

    if (quantidade < 0) return 'Informe um valor maior ou igual a zero'; // [esta linha foi adicionada]
    return null;
  }
}
