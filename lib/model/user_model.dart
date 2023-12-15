class UserModel {
  final String? id;
  final String? name;
  final String? age;
  final String? email;
  final String? about;
  final int? likes;
  final List<String>? imgUrl;

  UserModel(
      {this.id,
      this.name,
      this.age,
      this.email,
      this.about,
      this.likes,
      this.imgUrl});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      email: json['email'],
      about: json['about'],
      likes: json['likes'],
      imgUrl: List<String>.from(json['imgUrl']),
    );
  }
}
