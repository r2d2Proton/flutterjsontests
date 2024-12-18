import 'primitive.dart';
import 'point.dart';

class Triangle extends Primitive {

  Point p1;
  Point p2;
  Point p3;

  Triangle({required this.p1, required this.p2, required this.p3}) : super(name: 'triangle');

  factory Triangle.fromJson(Map<String, dynamic> json) {
    Point p1 = Point.fromJson(json['p1']);
    Point p2 = Point.fromJson(json['p2']);
    Point p3 = Point.fromJson(json['p3']);
    return Triangle(p1: p1, p2: p2, p3: p3);
  }

  @override
  Map<String, dynamic> toJson() {
    return { 'name': name, 'p1': p1, 'p2': p2, 'p3': p3 };
  }
}
