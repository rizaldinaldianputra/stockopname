class Payment {
  late int id = 0;
  late String name;
  late String type;
  late String codeBank;
  String? thumbnail;
  String? thumbnailTemp;
  bool selected = false;
  double adminFee = 0;
  String gateway = '';
  bool active = true;

  Payment({this.id = -1, this.name = '', this.type = '', this.codeBank = ''});

  Payment.fromJson(Map<String, dynamic> json)
      : id = json['id'] == null ? null : json['id'],
        name = json['name'] == null ? null : json['name'],
        type = json['type'] == null ? null : json['type'],
        codeBank = json['codeBank'] == null ? '' : json['codeBank'],
        adminFee = json['adminFee'] == null ? 0 : json['adminFee'],
        thumbnail = json['thumbnail'] == null ? null : json['thumbnail'],
        thumbnailTemp =
            json['thumbnailTemp'] == null ? null : json['thumbnailTemp'],
        gateway = json['gateway'] == null ? '' : json['gateway'],
        active = json['active'] == null ? false : json['active'];

  Payment.blankPayment()
      : id = -1;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type': type,
        'thumbnail': thumbnail,
        'thumbnailTemp': thumbnailTemp,
        'codeBank': codeBank,
        'adminFee': adminFee,
        'gateway': gateway,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Payment && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
