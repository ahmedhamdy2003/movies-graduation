class UserEntity {
  final String? name;
  final String? email;
  final String? phone;
  final String? password;
  final String? confirmPassword;
  final int? avatarId;

  UserEntity({
    this.confirmPassword,
    this.name,
    this.email,
    this.phone,
    this.password,
    this.avatarId,
  });
}
