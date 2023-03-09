
void main() {
  escolherMeioTransporteSwitch(Transporte.carro);
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
enum Transporte{
  carro,
  bike,
  andando,
  skate,
  aviao,
  patins,
  busao

}
