import 'package:flutter/material.dart';

class Alarmes extends StatefulWidget {
  const Alarmes({
    super.key,
  });

  @override
  State<Alarmes> createState() => _AlarmesState();
}

class _AlarmesState extends State<Alarmes> {
  @override
  Widget build(BuildContext context) {
    const tempo = "09:10";
    const titulo = "Titulo";
    const frequencia = "Todo dia";

    return ListView.builder(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 75),
      itemCount: 20,
      itemBuilder: (context, index) {
        return ItemListaAlarme(
          tempo: tempo,
          titulo: titulo,
          frequencia: frequencia,
        );
      },
    );
  }
}

class ItemListaAlarme extends StatefulWidget {
  const ItemListaAlarme({
    super.key,
    required this.tempo,
    required this.titulo,
    required this.frequencia,
  });

  final String tempo;
  final String titulo;
  final String frequencia;

  @override
  State<ItemListaAlarme> createState() => _ItemListaAlarmeState();
}

class _ItemListaAlarmeState extends State<ItemListaAlarme> {
  bool selecionado = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(widget.tempo, style: const TextStyle(fontSize: 22)),
            const SizedBox(width: 16),
            Text(widget.titulo),
          ],
        ),
        Row(
          children: [
            Text(widget.frequencia),
            const SizedBox(width: 16),
            Switch(
              value: selecionado,
              onChanged: (value) {
                setState(() {
                  selecionado = value;
                });
              },
            ),
          ],
        )
      ],
    );
  }
}
