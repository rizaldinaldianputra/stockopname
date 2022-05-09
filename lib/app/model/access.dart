class Access {
  late int id = 0;
  late String name;
  late String description;
  late String path;
  late String type;
  bool selected = false;

  Access(
      {this.id = -1,
      this.name = '',
      this.description = '',
      this.path = '',
      this.type = ''});

  Access.fromJson(Map<String, dynamic> json)
      : id = json['id'] == null ? null : json['id'],
        name = json['name'] == null ? null : json['name'],
        description = json['description'] == null ? null : json['description'],
        path = json['path'] == null ? null : json['path'],
        type = json['type'] == null ? null : json['type'];

  Access.blankAccess()
      : id = -1,
        name = '',
        description = '',
        path = '',
        type = '';

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'path': path,
        'type': type,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Access && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
