import 'venue.dart';

class EventModel {
  int id;
  String name = '';
  String description = '';
  DateTime? openTicket = DateTime.now() ;
  DateTime? closeTicket = DateTime.now() ;
  DateTime? startDate = DateTime.now() ;
  DateTime? endDate = DateTime.now();
  Venue? venue;

  EventModel({this.id = -1});

  EventModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] == null ? 0 : json['id'],
        name = json['name'] == null ? "" : json['name'],
        description = json['decription'] == null ? "" : json['decription'],
        openTicket = json['openTicket'] == null
            ? null
            : DateTime.parse(json['openTicket']),
        closeTicket = json['closeTicket'] == null
            ? null
            : DateTime.parse(json['closeTicket']),
        startDate = json['startDate'] == null
            ? null
            : DateTime.parse(json['startDate']),
        endDate =
            json['endDate'] == null ? DateTime(0) : DateTime.parse(json['endDate']),
        venue = json['venue'] == null ? null : Venue.fromJson(json['venue']);

  EventModel.blankEvent() : id = -1;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'openTicket': openTicket!.toIso8601String() == null ? DateTime.now() : openTicket!.toIso8601String(),
        'closeTicket': closeTicket!.toIso8601String() == null ? DateTime.now() : closeTicket!.toIso8601String(),
        'startDate': startDate!.toIso8601String() == null ? DateTime.now() : startDate!.toIso8601String(),
        'endDate': endDate!.toIso8601String() == null ? DateTime.now() : endDate!.toIso8601String(),
        'venue': venue
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventModel && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
