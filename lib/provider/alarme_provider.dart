import 'package:app_alarme/data/alarme_dao.dart';
import 'package:app_alarme/models/alarme_model.dart';
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

  Future adicionar(AlarmeModel alarme) async {
    await AlarmeDao().save(alarme);
    buscaTodos();
  }

  Future remover(String id) async {
    await AlarmeDao().delete(id);
    _alarme = AlarmeModel(
      id: "",
      tempo: "",
      titulo: "",
      frequencia: "",
      ativo: false,
    );
    buscaTodos();
  }

  buscaPorId(String id) async {
    List<AlarmeModel> data = await AlarmeDao().find(id);
    if (data.isNotEmpty) {
      _alarme = data.first;
      notifyListeners();
    } else {
      _alarme = AlarmeModel(
        id: "",
        tempo: "",
        titulo: "",
        frequencia: "",
        ativo: false,
      );
      notifyListeners();
    }
  }

  Future alterar(AlarmeModel alarme, String id) async {
    await AlarmeDao().update(alarme, id);
    buscaTodos();
  }

  buscaTodos() async {
    _alarmes = await AlarmeDao().findAll();
    notifyListeners();
  }
}

/*
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
*/
