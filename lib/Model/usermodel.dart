class UserModel {
  String? name;
  String? lastname;
  String? disease;
  String? address;
  String? city;
  String? state;
  String? gender;
  String? image;

  UserModel({
    this.name,
    this.lastname,
    this.disease,
    this.address,
    this.city,
    this.state,
    this.gender,
    this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['firstname'],
      lastname: json['lastname'],
      disease: json['disease'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      gender: json['gender'],
      image: json['image'],
    );
  }
}
