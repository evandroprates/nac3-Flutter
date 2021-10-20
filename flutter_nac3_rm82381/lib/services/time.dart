import 'package:flutter_nac3_rm82381/models/selecao.dart';

class SelecaoService {
  Future<List<Selecao>> findAll() async {
    return List<Selecao>.generate(
      10,
      (index) => Selecao(
        "$index",
        "Selecao $index",
        ((index + 1) * 12587.0),
      ),
    );
  }
}
