import 'package:flutter/material.dart';
import 'package:salvatore_app/Utils/Styles/styles.dart';

class RutaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ruta de entrega',
          style: CustomText.titulo_5_w,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(),
      ),
    );
  }
}
