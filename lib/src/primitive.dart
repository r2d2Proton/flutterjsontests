enum PrimitiveType { point, line, triangle, zigzag }

class Primitive {
  String name;

  Primitive({this.name = ''});
  
  factory Primitive.fromJson(Map<String, dynamic> json) {
    return Primitive(name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return { 'name': name };
  }
}
