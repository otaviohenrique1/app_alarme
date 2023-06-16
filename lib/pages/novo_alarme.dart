import 'package:flutter/material.dart';

class NovoAlarme extends StatefulWidget {
  const NovoAlarme({super.key});

  @override
  State<NovoAlarme> createState() => _NovoAlarmeState();
}

class _NovoAlarmeState extends State<NovoAlarme> {
  final TextEditingController _etiquetaController = TextEditingController();
  bool pular = false;
  bool tomChamada = false;
  String texto = "---";

  TimeOfDay? _selectedTime;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  String hora = "";
  String minuto = "";

  @override
  Widget build(BuildContext context) {
    hora = _selectedTime != null ? "${_selectedTime!.hour}" : '00';
    minuto = _selectedTime != null ? "${_selectedTime!.minute}" : '00';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Configurar alarme"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                texto = _etiquetaController.text;
              });
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _Relogio(hora: hora, minuto: minuto),
          ElevatedButton(
            onPressed: () => _selectTime(context),
            child: Text('Selecionar hora'),
          ),
          const Divider(),
          SizedBox(
            height: 50,
            child: TextField(
              controller: _etiquetaController,
              decoration: const InputDecoration(
                hintText: "Etiqueta",
                border: InputBorder.none,
              ),
            ),
          ),
          const Divider(),
          SizedBox(
            height: 50,
            child: InkWell(
              onTap: () {},
              child: Ink(
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Repetir"),
                    Text("Todo dia"),
                  ],
                ),
              ),
            ),
          ),
          const Divider(),
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Pular"),
                    Text("Pular para o proximo alarme"),
                  ],
                ),
                Switch(
                  value: pular,
                  onChanged: (value) {
                    setState(() {
                      pular = value;
                    });
                  },
                ),
              ],
            ),
          ),
          const Divider(),
          SizedBox(
            height: 50,
            child: InkWell(
              onTap: () {},
              child: Ink(
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tom de Chamada"),
                    Text("AlarmBeep"),
                  ],
                ),
              ),
            ),
          ),
          const Divider(),
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Pular"),
                Switch(
                  value: tomChamada,
                  onChanged: (value) {
                    setState(() {
                      tomChamada = value;
                    });
                  },
                ),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}

class _Relogio extends StatelessWidget {
  const _Relogio({
    // ignore: unused_element
    super.key,
    required this.hora,
    required this.minuto,
  });

  final String hora;
  final String minuto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _QuadradoComBorda(texto: hora),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(":", style: TextStyle(fontSize: 30)),
          ),
          _QuadradoComBorda(texto: minuto),
        ],
      ),
    );
  }
}

class _QuadradoComBorda extends StatelessWidget {
  const _QuadradoComBorda({
    // ignore: unused_element
    super.key,
    required this.texto,
  });

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Center(
          child: Text(
        texto,
        style: const TextStyle(fontSize: 30),
      )),
    );
  }
}
