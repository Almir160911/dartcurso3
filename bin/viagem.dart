import 'transporte.dart';

class Viagem{
  static String codigoTrabalho = "kfhjghd23";
  double dinheiro = 0;
  Transporte locomocao;
  Set<String> registrosVisitados = <String>{};
  Map<String, dynamic> registrarPrecos = {};
  int _totalLocalVisitado = 0;

  Viagem({required this.locomocao});

  printcodigoTrabalho()
  {
    print(codigoTrabalho);
  }

  void escolherMeioTransporteSwitch(Transporte locomocao){
    switch (locomocao){
      case Transporte.carro:
        print('vou de $locomocao para a aventura!');
        break;
      case Transporte.andando:
        print('vou de $locomocao para a aventura!');
        break;
      case Transporte.aviao:
        print('vou de $locomocao para a aventura!');
        break;
      case Transporte.busao:
        print('vou de $locomocao para a aventura!');
        break;
      case Transporte.patins:
        print('vou de $locomocao para a aventura!');
        break;
      case Transporte.skate:
        print('vou de $locomocao para a aventura!');
        break;
      case Transporte.bike:
        print('vou de $locomocao para a aventura!');
        break;
      default:
        print('Vou de carona para a aventura!');
        break;
    }

  }

  void visitar(String localvisita){
    registrosVisitados.add(localvisita);
    _totalLocalVisitado += 1;
  }

  void registrarPrecoVisita(String local, dynamic preco){
    registrarPrecos[local] = preco;

  }

  int get consultartotalVisitado{
    return _totalLocalVisitado;
  }

  void set alterartotalVisitado(int quantidade){
    if(quantidade <= 10) {
      _totalLocalVisitado = quantidade;
    }
    else{
      print('não é possível fazer $quantidade visitas no dia');
    }
  }


}