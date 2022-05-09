class TaskGroup {
  int id;
  String name;
  String description;
  bool selected = false;

  TaskGroup({this.id = -1, this.name = '', this.description = ''});

  TaskGroup.fromJson(Map<String, dynamic> json)
      : id = json['id'] == null ? null : json['id'],
        name = json['name'] == null ? null : json['name'],
        description = json['description'] == null ? null : json['description'];

  TaskGroup.blankTaskGroup()
      : id = -1,
        name = '',
        description = '';

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskGroup && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
