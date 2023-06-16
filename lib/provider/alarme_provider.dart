import 'package:app_alarme/models/alarme_model.dart';
import 'package:app_alarme/utils/lista.dart';
import 'package:flutter/material.dart';

class AlarmeProvider extends ChangeNotifier {
  List<AlarmeModel> _alarmes = [];
  AlarmeModel _alarme = AlarmeModel(
    id: "",
    tempo: "",
    titulo: "",
    frequencia: "",
    ativo: false,
  );

  List<AlarmeModel> get alarmes => _alarmes;
  AlarmeModel get alarme => _alarme;

  buscaPorId(String id) {
    AlarmeModel alarmeBuscado = alarmesLista.firstWhere(
      (element) => element.id == id,
      orElse: () => AlarmeModel(
        id: "",
        tempo: "",
        titulo: "",
        frequencia: "",
        ativo: false,
      ),
    );

    _alarme = alarmeBuscado;
    notifyListeners();
  }

  adicionar(AlarmeModel alarme) {
    alarmesLista.add(alarme);
    notifyListeners();
  }

  remover(String id) {
    alarmesLista.removeWhere((element) => element.id == alarme.id);
    notifyListeners();
  }

  alterar(AlarmeModel alarme, String id) {
    for (var i = 0; i < alarmesLista.length; i++) {
      var item = alarmesLista[i];
      if (item.id == id) {
        item.id = alarme.id;
        item.frequencia = alarme.frequencia;
        item.tempo = alarme.tempo;
        item.titulo = alarme.titulo;
        item.ativo = alarme.ativo;
        break;
      }
    }
    notifyListeners();
  }

  buscaTodos() {
    _alarmes = alarmesLista;
    // notifyListeners();
  }
}
