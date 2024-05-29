class UserModel {
  String? name;
  String? lastname;
  String? disease;
  String? address;
  String? city;
  String? state;
  String? image;
  String? gender;

  UserModel({
    this.name,
    this.lastname,
    this.disease,
    this.address,
    this.city,
    this.state,
    this.image,
    this.gender,
  });

  // Factory constructor to create UserModel from a Map
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'] as String?,
        lastname: json['lastname'] as String?,
        disease: json['disease'] as String?,
        address: json['address'] as String?,
        city: json['city'] as String?,
        state: json['state'] as String?,
        image: json['image'] as String?,
        gender: json['gender'] as String?,
      );

  // Method to convert UserModel object to a Map
  Map<String, dynamic> toJson() => {
        "name": name,
        "lastname": lastname,
        "image": image,
        "disease": disease,
        "address": address,
        "city": city,
        "state": state,
        "gender": gender,
      };
}
