import 'dart:convert';

class Tone {
  int id;
  String name;

  Tone({
    this.id = 0,
    this.name = "",
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Tone.fromMap(Map<String, dynamic> map) {
    return Tone(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Tone.fromJson(String source) => Tone.fromMap(json.decode(source));

  @override
  String toString() => 'Tone(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Tone && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
