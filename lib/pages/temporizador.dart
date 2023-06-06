import 'package:flutter/material.dart';

class Temporizador extends StatelessWidget {
  const Temporizador({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ItemTemporizador(),
        ItemTemporizador(),
        ItemTemporizador(),
        ItemTemporizador(),
        ItemTemporizador(),
      ],
    );
  }
}

class ItemTemporizador extends StatelessWidget {
  const ItemTemporizador({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.blueGrey,
            width: 2,
          ),
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.center,
            child: Text(
              "3 minutos",
              style: TextStyle(fontSize: 16),
            ),
          ),
          const Text(
            "00:03:00",
            style: TextStyle(fontSize: 48),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              "Iniciar",
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
