class UserModel {
  final String? id;
  final String? name;
  final String? age;
  final String? email;
  final String? about;
  final int? likes;
<<<<<<< HEAD
  final String? imgUrl;
=======
  final List<String>? imgUrl;
>>>>>>> abidev

  UserModel(
      {this.id,
      this.name,
      this.age,
      this.email,
      this.about,
      this.likes,
      this.imgUrl});
}
