import 'dart:ffi';

class UserModel {
  String? name;
  String? lastname;
  String? disease;
  String? address;
  String? city;
  String? state;
  String? image;
  String? gender;

  UserModel({this.name, this.lastname, this.image,this.disease,this.address,this.city,this.state,this.gender});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      lastname: json['lastname'],
      image: json['image'],
      disease: json['disease'],
      address: json['address'],
      city:json['city'],
      state: json['state'],
      gender: json['gender']

    );
  }
}
