import 'package:app_alarme/models/alarme_model.dart';
import 'package:app_alarme/provider/alarme_provider.dart';
import 'package:app_alarme/utils/lista.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Alarmes extends StatefulWidget {
  const Alarmes({
    super.key,
  });

  @override
  State<Alarmes> createState() => _AlarmesState();
}

class _AlarmesState extends State<Alarmes> {
  @override
  void initState() {
    super.initState();
    Provider.of<AlarmeProvider>(context, listen: false).buscaTodos();
  }

  @override
  Widget build(BuildContext context) {
    // AlarmeProvider alarmeProvider =
    //     Provider.of<AlarmeProvider>(context, listen: false);

    return Stack(
      children: [
        ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 16,
            bottom: 75,
          ),
          itemCount: Provider.of<AlarmeProvider>(context, listen: false)
              .alarmes
              .length,
          itemBuilder: (context, index) {
            var item = Provider.of<AlarmeProvider>(context, listen: false)
                .alarmes[index];
            return ItemListaAlarme(alarme: item);
          },
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

class BotaoFlutuante extends StatelessWidget {
  const BotaoFlutuante({
    super.key,
    required this.onPressed,
  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: Theme.of(context).colorScheme.primary,
      hoverColor: Theme.of(context).colorScheme.inversePrimary,
      focusColor: Theme.of(context).colorScheme.inversePrimary,
      onPressed: onPressed,
      tooltip: 'Increment',
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}

class ItemListaAlarme extends StatefulWidget {
  const ItemListaAlarme({
    super.key,
    required this.alarme,
  });

  final AlarmeModel alarme;

  @override
  State<ItemListaAlarme> createState() => _ItemListaAlarmeState();
}

class _ItemListaAlarmeState extends State<ItemListaAlarme> {
  bool selecionado = false;

  @override
  Widget build(BuildContext context) {
    AlarmeModel alarme = widget.alarme;
    // selecionado = alarme.ativo;

    updateSwitch(value) {
      setState(() {
        selecionado = value;
        Provider.of<AlarmeProvider>(context, listen: false).alterar(
          AlarmeModel(
            id: alarme.id,
            tempo: alarme.tempo,
            titulo: alarme.titulo,
            frequencia: alarme.frequencia,
            ativo: alarme.ativo,
          ),
          alarme.id,
        );
      });
    }

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(alarme.tempo, style: const TextStyle(fontSize: 22)),
                Text(alarme.titulo),
              ],
            ),
            Row(
              children: [
                Text(alarme.frequencia),
                const SizedBox(width: 16),
                Switch(value: selecionado, onChanged: updateSwitch),
              ],
            )
          ],
        ),
        const Divider(),
      ],
    );
  }
}

/*
class ItemListaAlarme extends StatefulWidget {
  const ItemListaAlarme({
    super.key,
    required this.id,
    required this.tempo,
    required this.titulo,
    required this.frequencia,
    required this.ativo,
  });

  final String id;
  final String tempo;
  final String titulo;
  final String frequencia;
  final bool ativo;

  @override
  State<ItemListaAlarme> createState() => _ItemListaAlarmeState();
}

class _ItemListaAlarmeState extends State<ItemListaAlarme> {
  bool selecionado = false;

  @override
  Widget build(BuildContext context) {
    selecionado = widget.ativo;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.tempo, style: const TextStyle(fontSize: 22)),
                Text(widget.titulo),
              ],
            ),
            Row(
              children: [
                Text(widget.frequencia),
                const SizedBox(width: 16),
                Consumer<AlarmeProvider>(
                  builder: (context, alarmeProviderConsumer, child) {
                    return Switch(
                      value: selecionado,
                      onChanged: (value) {
                        selecionado = value;
                        alarmeProviderConsumer.alterar(
                          AlarmeModel(
                            id: widget.id,
                            tempo: widget.tempo,
                            titulo: widget.titulo,
                            frequencia: widget.frequencia,
                            ativo: widget.ativo,
                          ),
                          widget.id,
                        );
                      },
                    );
                  },
                )
              ],
            )
          ],
        ),
        const Divider(),
      ],
    );
  }
}
*/
