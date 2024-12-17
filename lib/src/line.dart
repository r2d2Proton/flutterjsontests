import 'primitive.dart';
import 'point.dart';

class Line extends Primitive {

  Point p1;
  Point p2;

  Line({required this.p1, required this.p2})  : super(name: 'line');

  factory Line.fromJson(Map<String, dynamic> json) {
    return Line(p1: json['p1'], p2: json['p2']);
  }

  @override
  Map<String, dynamic> toJson() {
    return { 'p1': p1, 'p2': p2 };
  }
}
