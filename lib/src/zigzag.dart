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
    return ZigZag(points: json['points']);
  }

  @override
  Map<String, dynamic> toJson() {
    return { 'points': points };
  }
}
