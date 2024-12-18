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

  void setPrimitives(List<Primitive> primitives) {
    this.primitives = primitives;
  }
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
    primitives = _convertPrimitives(json['primitives']);
  }

  Map<String, dynamic> toJson() {
    return { 'id': id, 'name': name, 'primitives': primitives };
  }

  List<Primitive> _convertPrimitives(List<dynamic> json) {
    List<Primitive> primitives = [];
    json.forEach((v) {
      String name = v['name'];
        switch (name) {
          case 'primitive':
            primitives.add(Primitive.fromJson(v));
            break;

          case 'point':
            primitives.add(Point.fromJson(v));
            break;

          case 'line':
            primitives.add(Line.fromJson(v));
            break;

          case 'triangle':
            primitives.add(Triangle.fromJson(v));
            break;

          case 'zigzag':
            primitives.add(ZigZag.fromJson(v));
            break;
        }
      });

      return primitives;
  }
}
