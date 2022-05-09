class Organization {
  int id;
  String npwp = '';
  String type = '';
  String address = '';
  String email = '';
  String contact = '';
  String phone = '';
  String postcode = '';
  String image = '';
  String properties = '';

  Organization({this.id = -1});

  Organization.fromJson(Map<String, dynamic> json)
      : id = json['id'] == null ? null : json['id'],
        npwp = json['npwp'] == null ? '' : json['npwp'],
        type = json['type'] == null ? '' : json['type'],
        address = json['address'] == null ? '' : json['address'],
        email = json['email'] == null ? '' : json['email'],
        contact = json['contact'] == null ? '' : json['contact'],
        phone = json['phone'] == null ? '' : json['phone'],
        postcode = json['postcode'] == null ? '' : json['postcode'],
        image = json['image'] == null ? '' : json['image'],
        properties = json['properties'] == null ? '' : json['properties'];

  Organization.blank()
      : id = -1,
        npwp = '',
        type = '',
        address = '',
        email = '',
        contact = '',
        phone = '',
        postcode = '',
        image = '',
        properties = '';

  Map<String, dynamic> toJson() => {
        'id': id,
        'npwp': npwp,
        'type': type,
        'address': address,
        'email': email,
        'contact': contact,
        'phone': phone,
        'postcode': postcode,
        'image': image,
        'properties': properties
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Organization && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
