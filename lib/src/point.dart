import 'primitive.dart';

class Point extends Primitive {
  
  double x = 0.0;
  double y = 0.0;
  double z = 0.0;
  double w = 1.0;

  Point({this.x = 0.0, this.y = 0.0, this.z = 0.0, this.w = 0.0}) : super(name: 'point');

  factory Point.fromJson(Map<String, dynamic> json) {
    return Point(x: json['x'], y: json['y'], z: json['z'], w: json['w']);
  }

  @override
  Map<String, dynamic> toJson() {
    return { 'name': name, 'x': x, 'y': y, 'z': z, 'w': w };
  }
}
