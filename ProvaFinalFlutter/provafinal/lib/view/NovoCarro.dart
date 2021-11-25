import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../main.dart';
import '../provider/CarroProvider.dart';

class NovoCarro extends StatefulWidget {
  @override
  _NovoCarroState createState() => _NovoCarroState();
}

class _NovoCarroState extends State<NovoCarro> {
  //campos que controlam os textos
  TextEditingController marcaController = TextEditingController();
  TextEditingController anoFabricacaoController = TextEditingController();
  TextEditingController placaController = TextEditingController();
  TextEditingController valorRevendaController = TextEditingController();

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
              "Ano de fabricacao",
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
              controller: placaController,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Valor da revenda:",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              controller: valorRevendaController,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            ButtonTheme(
              child: ElevatedButton(
                onPressed: _inserir,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Salvar",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              buttonColor: Colors.grey.shade300,
            ),
            ButtonTheme(
              child: ElevatedButton(
                onPressed: _VoltarTelaInicio,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Inicio",
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

  void _inserir() async {
    CarroProvider carro = CarroProvider();
    Map<String, dynamic> linha = {
      CarroProvider.columnMarca: marcaController.text,
      CarroProvider.columnAnoFabricacao: anoFabricacaoController.text,
      CarroProvider.columnPlaca: placaController.text,
      CarroProvider.columnValorRevenda: valorRevendaController.text,
    };
    await carro.insert(linha);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Principal(),
      ),
    );
  }

  void _VoltarTelaInicio() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Principal(),
      ),
    );
  }
}
