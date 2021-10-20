class Selecao {
  final String id;
  final String nomeSelecao;
  final double recordePublico;

  Selecao(this.id, this.nomeSelecao, this.recordePublico);

  @override
  int get hashCode => id.hashCode ^ nomeSelecao.hashCode ^ recordePublico.hashCode;

  @override
  bool operator ==(other) =>
      other is Selecao &&
      other.id == id &&
      other.nomeSelecao == nomeSelecao &&
      other.recordePublico == recordePublico;
}
