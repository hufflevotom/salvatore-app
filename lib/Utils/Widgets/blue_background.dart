import 'package:flutter/material.dart';
import 'package:salvatore_app/Utils/Styles/custom_colors.dart';

class BlueBackground extends StatelessWidget {
  final Widget child;
  const BlueBackground({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.azul_100,
      width: double.infinity,
      height: double.infinity,
      child: Stack(children: [SafeArea(child: Center(child: this.child))]),
    );
  }
}
