import 'access.dart';

class Role {
  int id;
  String name;
  String description;
  List<Access?> access;
  bool selected = false;

  Role(
      {this.id = -1,
      this.name = '',
      this.description = '',
      this.access = const []});

  Role.fromJson(Map<String, dynamic> json)
      : id = json['id'] == null ? null : json['id'],
        name = json['name'] == null ? null : json['name'],
        description = json['description'] == null ? null : json['description'],
        access = json['access'] == null
            ? <Access?>[]
            : List<Access>.from(
                json['access'].map((model) => Access.fromJson(model)));

  Role.blankRole()
      : id = -1,
        name = '',
        description = '',
        access = [];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'access': access,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Role && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
