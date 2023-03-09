import 'dart:io';

void main(List<String> arguments) {
  String nome = 'Laranja';
  double peso = 100.2;
  String cor = 'Verde e Amarela';
  String sabor = 'Doce e cítrica';
  int diasDesdeColheita = 40;
  funcEstaMadura(nome, 20);
  mostrarMadura(nome, diasDesdeColheita, cor: cor, sabor: sabor, peso: peso);
  mostrarMadura(nome, diasDesdeColheita, cor: cor, peso: peso);
  diasDesdeColheita = 10;
  mostrarMadura(nome, diasDesdeColheita, cor: cor, peso: peso);
  diasDesdeColheita = 55;
  int quantosdias = quantosDiasMadura(diasDesdeColheita);
  print('Faltam $quantosdias dias');

  Fruta fruta01 = Fruta(nome, peso, cor, sabor, diasDesdeColheita);
  Fruta fruta02 = Fruta('Uva', 40, 'Roxa', 'Doce', 20);

  print('Nome da fruta ${fruta01.nome}');
  fruta01.estaMadura(20);
  fruta02.estaMadura(40);

  Legumes mandioca1 = Legumes('Macaxeira', 1200, 'Marrom', true);

  Frutas banana1 = Frutas('Banana', 75, 'Amarela', 'Doce', 12);

  Nozes macadamia1 = Nozes('Macadamia', 2, 'Branca amarelada', 'Doce', 20, 35);

  Citricas limao1 = Citricas('Limão', 100, 'Verde', 'Azedo', 5, 9);

  macadamia1.printAlimento();
  banana1.printAlimento();
  mandioca1.printAlimento();
  limao1.printAlimento();

  mandioca1.cozinhar();
  limao1.fazerSuco();
  banana1.separarIngredientes();
  banana1.fazerMassa();
  banana1.assar();
  limao1.separarIngredientes();
  limao1.fazerMassa();
  limao1.assar();
  macadamia1.fazerMassa();

  print('Qual a sua idade?');
  var entrada = stdin.readLineSync();

  if (entrada != null) {
    int idade = int.parse(entrada);
    print('Minha idade é $idade');
  }
  print('passou por aqui');
}

// Posicionaiss Obrigatórios
// Nomeados Opcionais
// Parâmetros com "Padrão"
// Modificador "required"
void funcEstaMadura(String nome, int dias) {
  if (dias >= 30) {
    print('$nome está madura.');
  } else {
    print('$nome não está madura.');
  }
}

void mostrarMadura(String nome, int dias,
    {required String cor, double? peso, String sabor = 'sem sabor'}) {
  if (dias >= 30) {
    print('$nome está madura com sabor $sabor com a cor $cor e o peso $peso.');
  } else {
    print('$nome não está madura.');
  }
}

int quantosDiasMadura(int dias) {
  int diasMadura = 30;
  int quantosDiasFaltam = dias - diasMadura;
  return quantosDiasFaltam;
}

class Fruta {
  String nome;
  double peso;
  String cor;
  String sabor;
  int diasDesdeColheita;
  bool? isMadura;

  Fruta(this.nome, this.peso, this.cor, this.sabor, this.diasDesdeColheita,
      {this.isMadura});
  Fruta.nomeados(
      {required this.nome,
      required this.peso,
      required this.cor,
      required this.sabor,
      required this.diasDesdeColheita,
      required this.isMadura});

  Fruta.nomeminusculo(this.nome, this.cor, this.diasDesdeColheita,
      this.isMadura, this.peso, this.sabor) {
    nome = nome.toLowerCase();
    cor = cor.toLowerCase();
    sabor = cor.toLowerCase();
  }

  estaMadura(int diasParaMadura) {
    isMadura = diasDesdeColheita >= diasParaMadura;
    print(
        'A sua $nome foi colhida a $diasDesdeColheita e precisa de $diasDesdeColheita dias para comer.Está madura $isMadura');
  }
}

class Alimento {
  String nome;
  double peso;
  String cor;

  Alimento(this.nome, this.peso, this.cor);

  void printAlimento() {
    print('Este(a) $nome pesa $peso gramas e é $cor.');
  }
}

class Legumes extends Alimento implements Bolo {
  bool isPrecisaCozinhar;

  Legumes(String nome, double peso, String cor, this.isPrecisaCozinhar)
      : super(nome, peso, cor);

  void cozinhar() {
    if (isPrecisaCozinhar) {
      print('Pronto, o $nome está cozinhando');
    } else {
      print('Nem precisa cozinhar o $nome.');
    }
  }

  @override
  void assar() {}

  @override
  void fazerMassa() {}
  @override
  void separarIngredientes() {}
}

class Frutas extends Alimento implements Bolo {
  String sabor;
  int diasDesdeColheita;
  bool? isMadura;

  Frutas(
      String nome, double peso, String cor, this.sabor, this.diasDesdeColheita,
      {this.isMadura})
      : super(nome, peso, cor);

  void estaMadura(int diasParaMadura) {
    isMadura = diasDesdeColheita >= diasParaMadura;
    print('A sua $nome foi colhida a $diasDesdeColheita dias e precisa de'
        ' $diasParaMadura dias para poder comer'
        'Ela está madura? $isMadura');
  }

  void fazerSuco() {
    print('Você fez um ótimo suco de $nome.');
  }

  @override
  void separarIngredientes() {
    print('Catar a fruta $nome');
  }

  @override
  void fazerMassa() {
    print('Misturar a fruta $nome com a farinha, açucar e ovos');
  }

  @override
  void assar() {
    print('Colocar no forno');
  }
}

class Citricas extends Frutas {
  double nivelAzedo;

  Citricas(String nome, double peso, String cor, sabor, int diasDesdeColheita,
      this.nivelAzedo)
      : super(nome, peso, cor, sabor, diasDesdeColheita);

  void existeRefri(bool existe) {
    if (existe) {
      print('Não existe refrigerante de $nome');
    } else {
      print('Existe refrigerante de $nome');
    }
  }
}

class Nozes extends Frutas {
  double porcentagemOleoNatural;

  Nozes(String nome, double peso, String cor, sabor, diasDesdeColheita,
      this.porcentagemOleoNatural)
      : super(nome, peso, cor, sabor, diasDesdeColheita);

  @override
  void fazerMassa() {
    print('Tirar a casca de $nome');
    super.fazerMassa();
  }
}

abstract class Bolo {
  void separarIngredientes();
  void fazerMassa();
  void assar();
}
