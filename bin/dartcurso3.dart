import 'viagem.dart';
import 'transporte.dart';

void main() {
  Viagem viagemMaio = Viagem(locomocao: Transporte.aviao);
  print(viagemMaio.consultartotalVisitado);
  viagemMaio.visitar('Museu');
  print(viagemMaio.consultartotalVisitado);
  viagemMaio.alterartotalVisitado = 100;
  print(viagemMaio.consultartotalVisitado);


}





