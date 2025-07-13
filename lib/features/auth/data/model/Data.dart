
import '../../domain/entity/user_entity.dart';

class Data extends UserEntity {
  Data({
    super.email,
    this.password,
    super.name,
    super.phone,
    this.avaterId,
    this.confirmPassword,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Data.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    phone = json['phone'];
    avaterId = json['avaterId'];
    confirmPassword = json['confirmPassword'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? email;
  String? password;
  String? name;
  String? phone;
  int? avaterId;
  String? confirmPassword;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    map['name'] = name;
    map['phone'] = phone;
    map['avaterId'] = avaterId;
    map['confirmPassword'] = confirmPassword;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}