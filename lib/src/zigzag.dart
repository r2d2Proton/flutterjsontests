import 'primitive.dart';
import 'point.dart';

class ZigZag extends Primitive {

  List<Point> points = [];

  ZigZag({required this.points}) : super(name: 'zigzag');

  List<Point> getPoints() {
    return points;
  }

  void addPoint(Point point) {
    points.add(point);
  }

  void clearPoints() {
    points.clear();
  }

  factory ZigZag.fromJson(Map<String, dynamic> json) {
    List<Point> points = [];
    json['points'].forEach((v) { points.add(Point.fromJson(v)); });
    return ZigZag(points: points);
  }

  @override
  Map<String, dynamic> toJson() {
    return { 'name': name, 'points': points };
  }
}
