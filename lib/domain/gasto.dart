
class Gasto{
  final double valor;
  final DateTime data;
  final String descricao;
  final String formaDePagamento;

  Gasto({
    required this.valor,
    required this.data,
    required this.descricao,
    required this. formaDePagamento}):assert(valor >= 0);
}

class ControleDegastos{
   final List <Gasto>_gastos = [];


  void adicionarGasto(Gasto gasto){
    _gastos.add(gasto);
  }
  
  double get total{
    double soma =0;
    for( var gasto in _gastos){
      soma += gasto.valor;
    }
    return soma;
  }
}