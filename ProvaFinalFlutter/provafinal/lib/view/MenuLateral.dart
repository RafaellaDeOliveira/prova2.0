import 'package:flutter/material.dart';

import '../main.dart';
import 'NovoCarro.dart';

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey.shade200,
        child: ListView(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).padding.vertical),
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: Text(
                'Início',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
              onTap: () => {
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Listagem(),
                  ),
                )
              },
            ),
            ListTile(
              leading: Icon(
                Icons.plus_one,
                color: Colors.black,
              ),
              title: Text(
                'Novo Carro',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NovoCarro(),
                  ),
                )
              },
            ),
          ],
        ),
      ),
    );
  }
}
