class TicketType {
  int id;
  String name = '';
  String description = '';
  String thumbnail = '';
  String thumbnailTemp = '';
  String banner = '';
  bool isLimited = false;
  String bannerTemp = '';

  TicketType({this.id = -1});

  TicketType.fromJson(Map<String, dynamic> json)
      : id = json['id'] == null ? null : json['id'],
        name = json['name'] == null ? '' : json['name'],
        description = json['description'] == null ? '' : json['description'],
        thumbnail = json['thumbnail'] == null ? '' : json['thumbnail'],
        thumbnailTemp =
            json['thumbnailTemp'] == null ? '' : json['thumbnailTemp'],
        banner = json['banner'] == null ? '' : json['banner'],
        isLimited = json['isLimited'] == null ? false : json['isLimited'],
        bannerTemp = json['bannerTemp'] == null ? '' : json['bannerTemp'];

  TicketType.blankTicketType() : id = -1;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'thumbnail': thumbnail,
        'thumbnailTemp': thumbnailTemp,
        'banner': banner,
        'isLimited': isLimited,
        'bannerTemp': bannerTemp,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TicketType && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
