import 'group.dart';
import 'organization.dart';
import 'role.dart';
import 'taskGroup.dart';

class User {
  String nikuser;
  String user;
  String password;
  String tgl_daftar;
  String waktu;
  String nikpendaftar;
  String aktif;
  String menu_id;

  User(
      {required this.nikuser,
      required this.user,
      required this.password,
      required this.tgl_daftar,
      required this.waktu,
      required this.nikpendaftar,
      required this.aktif,
      required this.menu_id});

  User.fromJson(Map<String, dynamic> json)
      : nikuser = json['nikuser'] == null ? null : json['nikuser'],
        user = json['user'] == null ? '' : json['user'],
        password = json['password'] == null ? '' : json['password'],
        tgl_daftar = json['tgl_daftar'] == null ? '' : json['tgl_daftar'],
        waktu = json['waktu'] == null ? '' : json['waktu'],
        nikpendaftar = json['nikpendaftar'] == null ? '' : json['nikpendaftar'],
        aktif = json['aktif'] == null ? '' : json['aktif'],
        menu_id = json['menu_id'] == null ? '' : json['menu_id'];

  User.blankUser()
      : nikuser = '',
        user = '',
        password = '',
        tgl_daftar = '',
        waktu = '',
        nikpendaftar = '',
        aktif = '',
        menu_id = '';

  Map<String, dynamic> toJson() => {
        'nikuser': nikuser,
        'user': user,
        'password': password,
        'tgl_daftar': tgl_daftar,
        'waktu': waktu,
        'nikpendaftar': nikpendaftar,
        'aktif': aktif,
        'menu_id': menu_id,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          nikuser == other.nikuser;

  @override
  int get hashCode => nikuser.hashCode;
}
