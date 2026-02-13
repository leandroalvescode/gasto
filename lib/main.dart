import 'package:flutter/material.dart';
import 'package:gastos/domain/gasto.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaControleDeGastos());
  }
}

class TelaControleDeGastos extends StatefulWidget {
  const TelaControleDeGastos({super.key});

  @override
  State<TelaControleDeGastos> createState() => _TelaControleDeGastos();

}

class _TelaControleDeGastos extends State<TelaControleDeGastos> {
  final ControleDegastos _controle = ControleDegastos();

  
  void novoGasto(double valor, String descricao, String formaDePagamento){
    _controle.adicionarGasto(
      Gasto(
        valor: valor, 
        data: DateTime.now(), 
        descricao: descricao, 
        formaDePagamento: formaDePagamento));
  }

  @override
  void initState() {
    super.initState();

    _controle.adicionarGasto(
      Gasto(
        valor: 100.0,
        data: DateTime.now(),
        descricao: "teste1",
        formaDePagamento: "PIX",
      ),
    );

    _controle.adicionarGasto(
      Gasto(
        valor: 50.5,
        data: DateTime.now(),
        descricao: "teste2",
        formaDePagamento: "Pix",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: <Widget>[
            Text(_controle.total.toStringAsFixed(2),
          ),
          Text(_controle.total.toStringAsFixed(2),
          ),
          ElevatedButton(
            onPressed: (){
              setState(() {
                novoGasto(20, "lanche", "PIX");
              });
            }, 
            child: Text("Novo gasto"),
            ),
          ],
        ),
      ),
    );
  }
}
