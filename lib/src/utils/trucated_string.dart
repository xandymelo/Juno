String truncateString(String input, int maxLength) {
  if (input.length <= maxLength) {
    return input; // Retorna a string original se for menor ou igual ao tamanho máximo
  } else {
    return input.substring(0, maxLength) + '...'; // Trunca a string e adiciona "..." no final
  }
}
