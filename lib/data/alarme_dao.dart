import 'package:app_alarme/data/database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:app_alarme/data/base_dao.dart';
import 'package:app_alarme/models/alarme_model.dart';

class AlarmeDao implements BaseDao<AlarmeModel> {
  static const String tabelaSql = "CREATE TABLE $_nomeTabela ("
      "$_id TEXT, "
      "$_tempo TEXT, "
      "$_titulo TEXT, "
      "$_frequencia TEXT, "
      "$_ativo BOOLEAN"
      ")";

  static const String _nomeTabela = "tarefaTabela";

  static const String _id = "id";
  static const String _tempo = "tempo";
  static const String _titulo = "titulo";
  static const String _frequencia = "frequencia";
  static const String _ativo = "ativo";

  @override
  Future<int> save(AlarmeModel alarme) async {
    final Database bancoDeDados = await getDatabase(); // Criar conexao
    Map<String, dynamic> alarmeMap = toMap(alarme);
    return await bancoDeDados.insert(_nomeTabela, alarmeMap);
  }

  @override
  Future<int> update(AlarmeModel alarme, String id) async {
    final Database bancoDeDados = await getDatabase(); // Criar conexao
    Map<String, dynamic> alarmeMap = toMap(alarme);
    return await bancoDeDados
        .update(_nomeTabela, alarmeMap, where: "$_id = ?", whereArgs: [id]);
  }

  @override
  Future<List<AlarmeModel>> findAll() async {
    final Database bancoDeDados = await getDatabase(); // Criar conexao
    final List<Map<String, dynamic>> resultado =
        await bancoDeDados.query(_nomeTabela);
    return toList(resultado);
  }

  @override
  Future<List<AlarmeModel>> find(String id) async {
    final Database bancoDeDados = await getDatabase(); // Criar conexao
    final List<Map<String, dynamic>> resultado = await bancoDeDados.query(
      _nomeTabela,
      where: "$_id = ?",
      whereArgs: [id],
    );
    return toList(resultado);
  }

  @override
  Future<int> delete(String id) async {
    final Database bancoDeDados = await getDatabase(); // Criar conexao
    return await bancoDeDados
        .delete(_nomeTabela, where: "$_id = ?", whereArgs: [id]);
  }

  @override
  Map<String, dynamic> toMap(AlarmeModel alarme) {
    final Map<String, dynamic> mapaAlarmes = {};
    mapaAlarmes[_id] = alarme.id;
    mapaAlarmes[_tempo] = alarme.tempo;
    mapaAlarmes[_titulo] = alarme.titulo;
    mapaAlarmes[_frequencia] = alarme.frequencia;
    mapaAlarmes[_ativo] = alarme.ativo;
    return mapaAlarmes;
  }

  @override
  List<AlarmeModel> toList(List<Map<String, dynamic>> mapaAlarmes) {
    final List<AlarmeModel> alarmes = [];
    for (Map<String, dynamic> linha in mapaAlarmes) {
      final AlarmeModel tarefa = AlarmeModel(
        id: linha[_id],
        tempo: linha[_tempo],
        titulo: linha[_titulo],
        frequencia: linha[_frequencia],
        ativo: linha[_ativo],
      );
      alarmes.add(tarefa);
    }
    return alarmes;
  }
}
