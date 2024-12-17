import 'primitive.dart';
import 'point.dart';
import 'line.dart';
import 'triangle.dart';
import 'zigzag.dart';

class Player {

  String id = '';
  String name = '';
  List<Primitive> primitives = <Primitive>[];

  Player({required this.id, required this.name});

  List<Primitive> getPrimitives() {
    return primitives;
  }

  void addPrimitive(dynamic primitive) {
    primitives.add(primitive);
  }

  void clearPrimitives() {
    primitives.clear();
  }

  Player.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    primitives = json['primitives'];
  }

  Map<String, dynamic> toJson() {
    return { 'id': id, 'name': name, 'primitives': primitives };
  }
}
