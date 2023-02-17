class UserModel {
  final String name;
  final String phone;
  final String address;
  final String token;
  UserModel({
    required this.name,
    required this.address,
    required this.phone,
    required this.token,
  });
  factory UserModel.fromJson(Map json) {
    return UserModel(
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      token: json['token'],
    );
  }
  Map<String,dynamic> toMap() {
    return {
      'name':name,
      'address':address,
      'phone':phone,
      'token':token,
      
    };
  }
}
