class UserModel {
  final String name;
  final String email;
  final String image;
  final String token;
  UserModel({
    required this.name,
    required this.image,
    required this.email,
    required this.token,
  });
  factory UserModel.fromJson(Map json) {
    return UserModel(
      name: json['name'],
      image: json['image'],
      email: json['email'],
      token: json['token'],
    );
  }
  Map<String,dynamic> toMap() {
    return {
      'name':name,
      'image':image,
      'email':email,
      'token':token,
      
    };
  }
}
