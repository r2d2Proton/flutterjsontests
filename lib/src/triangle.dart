import 'primitive.dart';
import 'point.dart';

class Triangle extends Primitive {

  Point p1;
  Point p2;
  Point p3;

  Triangle({required this.p1, required this.p2, required this.p3}) : super(name: 'triangle');

  factory Triangle.fromJson(Map<String, dynamic> json) {
    return Triangle(p1: json['p1'], p2: json['p2'], p3: json['p3']);
  }

  @override
  Map<String, dynamic> toJson() {
    return { 'p1': p1, 'p2': p2, 'p3': p3 };
  }
}
