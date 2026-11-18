import '../models/material_evento.dart';
import '../services/database_service.dart';

// Somente esta classe consulta ou altera os registros da tabela materiais.
class MaterialRepository {
  final DatabaseService service;
  MaterialRepository(this.service);

  // A leitura já está pronta: o app abre mostrando os quatro materiais iniciais.
  Future<List<MaterialEvento>> listar() async {
    final db = await service.database;
    final linhas = await db.query('materiais', orderBy: 'nome COLLATE NOCASE');
    return linhas.map((linha) => MaterialEvento.fromMap(linha)).toList();
  }

  Future<bool> existeNome(String nome, {int? ignorarId}) async {
    // (BLE) TODO 4: consulte o nome normalizado no banco.
    // Quando ignorarId for informado, exclua esse ID da busca de duplicidade.
        final db = await service.database;

    final nomeNormalizado = nome.trim().toLowerCase();

    final resultado = await db.query(
      'materiais',
      where: ignorarId == null
          ? 'nome_normalizado = ?'
          : 'nome_normalizado = ? AND id <> ?',
      whereArgs: ignorarId == null
          ? [nomeNormalizado]
          : [nomeNormalizado, ignorarId],
    );

    return resultado.isNotEmpty;
  }

  Future<void> inserir(MaterialEvento material) async {
    // (BLE) TODO 5: Insira material.toMap() na tabela materiais.
    final db = await service.database;

    await db.insert('materiais', material.toMap());
  }

  Future<void> atualizar(MaterialEvento material) async {
    // (BLE) TODO 6: Atualize somente o registro cujo ID está em material.id.
    final db = await service.database;

    await db.update(
      'materiais',
      material.toMap(),
      where: 'id = ?',
      whereArgs: [material.id],
    );
  }

  Future<void> excluir(int id) async {
    // (BLE) TODO 7: Exclua somente o registro cujo ID foi recebido.
    final db = await service.database;

    await db.delete(
      'materiais',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
