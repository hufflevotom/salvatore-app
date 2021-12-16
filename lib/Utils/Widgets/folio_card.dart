import 'package:flutter/material.dart';
import 'package:salvatore_app/Utils/Styles/custom_colors.dart';

class FolioCard extends StatelessWidget {
  final Widget child;
  final String estado;
  final Function() onTap;
  const FolioCard(
      {Key? key,
      required this.child,
      this.estado = 'pendiente',
      required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: GestureDetector(
        onTap: this.onTap,
        child: Container(
          width: double.infinity,
          decoration: _cardShape(),
          padding: EdgeInsets.all(20),
          child: this.child,
        ),
      ),
    );
  }

  BoxDecoration _cardShape() => BoxDecoration(
          color: estado == 'pendiente'
              ? CustomColors.blanco
              : estado == 'no entregado'
                  ? CustomColors.rojo_60
                  : estado == 'entregado'
                      ? CustomColors.verde_60
                      : CustomColors.blanco,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: CustomColors.gris_80,
              blurRadius: 5,
              offset: Offset(0, 4),
            )
          ]);
}
