class Location {
  int id;
  String? name;
  String? code;
  int? level;
  String? location;
  Location? parent;
  bool selected = false;
  String? codeLocation;

  Location({this.id = -1});

  Location.fromJson(Map<String, dynamic> json)
      : id = json['id'] == null ? null : json['id'],
        name = json['name'] == null ? null : json['name'],
        code = json['code'] == null ? null : json['code'],
        level = json['level'] == null ? null : json['level'],
        location = json['location'] == null ? null : json['location'],
        codeLocation = json['codeLocation'] == null ? null : json['codeLocation'],
        parent = json['parent'] == null
            ? Location.blankLocation()
            : Location.fromJson(json['parent']);
        

  Location.blankLocation() : id = -1;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'code': code,
        'codeLocation': codeLocation,
        'level': level,
        'location': location,
        'parent': parent,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Location && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
