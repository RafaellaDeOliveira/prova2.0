import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../main.dart';
import '../model/Carro.dart';
import '../provider/CarroProvider.dart';

class AlteraCarros extends StatefulWidget {
  late final Carro carros;

  AlteraCarros(this.carros);
  @override
  _AlteraCarrosState createState() => _AlteraCarrosState();
}

class _AlteraCarrosState extends State<AlteraCarros> {
  //campos que controlam os textos
  TextEditingController marcaController = TextEditingController();
  TextEditingController anoFabricacaoController = TextEditingController();
  TextEditingController placaController = TextEditingController();
  TextEditingController valorRevendaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    marcaController.text = widget.carros.marca;
    anoFabricacaoController.text = widget.carros.anoFabricacao;
    placaController.text = widget.carros.placa;
    valorRevendaController.text = widget.carros.valorRevenda;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text(
              "Marca:",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              controller: marcaController,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Ano da fabricacao:",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              controller: anoFabricacaoController,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Placa:",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              maxLines: null,
              minLines: 3,
              controller: placaController,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Valor revenda:",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              maxLines: null,
              minLines: 3,
              controller: valorRevendaController,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            ButtonTheme(
              child: ElevatedButton(
                onPressed: _atualizar,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Atualizar",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              buttonColor: Colors.grey.shade300,
            )
          ],
        ),
      ),
    );
  }

  void _atualizar() async {
    CarroProvider carro = CarroProvider();
    Map<String, dynamic> linha = {
      CarroProvider.columnId: widget.carros.id,
      CarroProvider.columnMarca: marcaController.text,
      CarroProvider.columnAnoFabricacao: anoFabricacaoController.text,
      CarroProvider.columnPlaca: placaController.text,
      CarroProvider.columnValorRevenda: valorRevendaController.text,
    };
    await carro.update(linha);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Listagem(),
      ),
    );
  }
}
