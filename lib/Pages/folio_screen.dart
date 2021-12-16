import 'package:flutter/material.dart';
import 'package:salvatore_app/Utils/Styles/styles.dart';

class FolioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Folio',
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
