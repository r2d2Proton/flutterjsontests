import 'primitive.dart';
import 'point.dart';
import 'line.dart';
import 'triangle.dart';
import 'zigzag.dart';
import 'player.dart';

class Game {

  String id = '';
  String name = '';
  String title = '';

  Map<String, Player> players = <String, Player>{ };

  Game({required this.id, required this.name, required this.title});

  Map<String, Player> getPlayers() {
    return players;
  }

  void addPlayer(Player player) {
    players[player.id] = player;
  }

  void clearPlayers() {
    players.clear();
  }

  Game.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
    //players = _convertPlayers(json['players']);
    players = {
      for (var MapEntry(:key, :value) in json['players'].entries)
        key: Player.fromJson(value),
    };
  }

  Map<String, dynamic> toJson() {
    return { 'id': id, 'name': name, 'title': title, 'players': players };
  }

  Map<String, Player> _convertPlayers(Map<String, dynamic> json) {
    Map<String, Player> players = <String, Player>{};
    json.forEach((k, v) {
      players[v['id']] = Player.fromJson(v);
    });

    return players;
  }
}
