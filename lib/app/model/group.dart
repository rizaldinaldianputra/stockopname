import 'ticketType.dart';

class Group {
  int id;
  String name;
  String description;
  List<TicketType?> ticketType;
  bool selected = false;

  Group({this.id = -1, this.name = '', this.description = '', this.ticketType = const []});

  Group.fromJson(Map<String, dynamic> json)
      : id = json['id'] == null ? null : json['id'],
        name = json['name'] == null ? null : json['name'],
        description = json['description'] == null ? null : json['description'],
        ticketType = json['ticketType'] == null
            ? <TicketType?>[]
            : List<TicketType>.from(
                json['ticketType'].map((model) => TicketType.fromJson(model)));

  Group.blankGroup()
      : id = -1,
        name = '',
        description = '',
        ticketType = [];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'productCategories': ticketType,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Group && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
