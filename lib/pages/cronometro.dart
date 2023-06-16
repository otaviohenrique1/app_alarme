import 'package:app_alarme/components/botao_flutuante.dart';
import 'package:flutter/material.dart';

class Cronometro extends StatelessWidget {
  const Cronometro({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          shrinkWrap: true,
          children: [],
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: BotaoFlutuante(onPressed: () {}),
        ),
      ],
    );
  }
}
