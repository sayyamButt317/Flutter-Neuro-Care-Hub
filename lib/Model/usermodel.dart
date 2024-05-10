class UserModel {
  String? name;
  String? phone;
  String? image;

  UserModel({this.name, this.phone, this.image});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      phone: json['phone'],
      image: json['image'],
    );
  }
}
