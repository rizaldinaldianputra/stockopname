import 'location.dart';

class Venue {
  int id;
  String name = '';
  String description = '';
  String code = '';
  String location = '';
  String adminEmail = '';
  Location? locationLvl1;
  Location? locationLvl2;
  Location? locationLvl3;
  Location? locationLvl4;

  Venue({this.id = -1});

  Venue.fromJson(Map<String, dynamic> json)
      : id = json['id'] == null ? -1 : json['id'],
        name = json['name'] == null ? "" : json['name'],
        description = json['description'] == null ? "" : json['description'],
        code = json['code'] == null ? "" : json['code'],
        location = json['location'] == null ? "" : json['location'],
        adminEmail = json['adminEmail'] == null ? "" : json['adminEmail'],
        locationLvl1 = json['locationLvl1'] == null
            ? Location.blankLocation()
            : Location.fromJson(json['locationLvl1']),
        locationLvl2 = json['locationLvl2'] == null
            ? Location.blankLocation()
            : Location.fromJson(json['locationLvl2']),
        locationLvl3 = json['locationLvl3'] == null
            ? Location.blankLocation()
            : Location.fromJson(json['locationLvl3']),
        locationLvl4 = json['locationLvl4'] == null
            ? Location.blankLocation()
            : Location.fromJson(json['locationLvl4']);

  Venue.blankVanue()
      : id = -1,
        name = '',
        description = '',
        code = '',
        location = '',
        adminEmail = '',
        locationLvl1 = Location.blankLocation(),
        locationLvl2 = Location.blankLocation(),
        locationLvl3 = Location.blankLocation(),
        locationLvl4 = Location.blankLocation();

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'code': code,
        'location': location,
        'adminEmail': adminEmail,
        'locationLvl1': locationLvl1,
        'locationLvl2': locationLvl2,
        'locationLvl3': locationLvl3,
        'locationLvl4': locationLvl4
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Venue && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
