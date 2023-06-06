import 'package:flutter/material.dart';

class Temporizador extends StatelessWidget {
  const Temporizador({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 75),
      itemCount: 10,
      itemBuilder: (context, index) {
        String tempo = "3 minuto(s)";
        String cronometro = "00:03:00";

        return ItemTemporizador(
          tempo: tempo,
          cronometro: cronometro,
        );
      },
    );
  }
}

class ItemTemporizador extends StatefulWidget {
  const ItemTemporizador({
    super.key,
    required this.tempo,
    required this.cronometro,
  });

  final String tempo;
  final String cronometro;

  @override
  State<ItemTemporizador> createState() => _ItemTemporizadorState();
}

class _ItemTemporizadorState extends State<ItemTemporizador> {
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
          Align(
            alignment: Alignment.center,
            child: Text(
              widget.tempo,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Text(
            widget.cronometro,
            style: const TextStyle(fontSize: 48),
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
