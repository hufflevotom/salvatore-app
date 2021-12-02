import 'package:flutter/material.dart';
import 'package:salvatore_app/Utils/Styles/custom_colors.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  const CustomCard({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Container(
        width: double.infinity,
        decoration: _cardShape(),
        padding: EdgeInsets.all(40),
        child: this.child,
      ),
    );
  }

  BoxDecoration _cardShape() => BoxDecoration(
          color: CustomColors.gris_60,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: CustomColors.negro_80,
              blurRadius: 5,
              offset: Offset(0, 4),
            )
          ]);
}
