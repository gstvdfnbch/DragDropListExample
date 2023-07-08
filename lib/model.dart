class Pagina {
  List<Produto> produtosList = [];
  Pagina({required this.produtosList});
}

class Produto {
  String pathImage;
  double preco;
  String texto1;
  String texto2;

  Produto({
    required this.pathImage,
    required this.preco,
    required this.texto1,
    required this.texto2,
  });
}
