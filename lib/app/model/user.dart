import 'group.dart';
import 'organization.dart';
import 'role.dart';
import 'taskGroup.dart';

class User {
  int id;
  String userName;
  String password;
  String firstName;
  String lastName;
  String email;
  String authdata;
  String token;
  String avatar;
  String type;
  String phoneno = '';
  String? thumbnail;

  List<Role?> roles;
  List<TaskGroup?> taskgroup;
  Group group;
  Organization organization;
  bool selected = false;

  User(
      this.id,
      this.userName,
      this.password,
      this.firstName,
      this.lastName,
      this.email,
      this.authdata,
      this.token,
      this.avatar,
      this.type,
      this.roles,
      this.taskgroup,
      this.group,
      this.organization);

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] == null ? null : json['id'],
        userName = json['userName'] == null ? '' : json['userName'],
        password = json['password'] == null ? '' : json['password'],
        firstName = json['firstName'] == null ? '' : json['firstName'],
        lastName = json['lastName'] == null ? '' : json['lastName'],
        email = json['email'] == null ? '' : json['email'],
        authdata = json['authdata'] == null ? '' : json['authdata'],
        token = json['token'] == null ? '' : json['token'],
        avatar = json['avatar'] == null ? '' : json['avatar'],
        phoneno = json['phoneno'] == null ? '' : json['phoneno'],
        type = json['type'] == null ? '' : json['type'],
        thumbnail = json['thumbnail'] == null ? '' : json['thumbnail'],
        roles = json['roles'] == null
            ? <Role?>[]
            : List<Role>.from(json['roles'].map((model) => Role.fromJson(model))),
        taskgroup = json['taskgroup'] == null
            ? <TaskGroup?>[]
            : List<TaskGroup>.from(json['taskgroup'].map((model) => TaskGroup.fromJson(model))),
        group = json['group'] == null ? Group.blankGroup() : Group.fromJson(json['group']),
        organization = json['organization'] == null
            ? Organization.blank()
            : Organization.fromJson(json['organization']);

  User.blankUser()
      : id = -1,
        userName = '',
        password = '',
        firstName = '',
        lastName = '',
        email = '',
        authdata = '',
        token = '',
        avatar = '',
        phoneno = '',
        type = '',
        roles = [],
        taskgroup = [],
        group = Group.blankGroup(),
        organization = Organization.blank();

  Map<String, dynamic> toJson() => {
        'id': id,
        'userName': userName,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'authdata': authdata,
        'token': token,
        'avatar': avatar,
        'phoneno': phoneno,
        'type': type,
        'thumbnail': thumbnail,
        'roles': roles,
        'taskgroup': taskgroup,
        'group': group,
        'organization': organization
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
