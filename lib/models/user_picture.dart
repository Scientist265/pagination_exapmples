class UserPicture {
  final String large;
  final String medium;
  final String thumbnail;
  UserPicture(
      {required this.large, required this.medium, required this.thumbnail});

  factory UserPicture.fromMap(Map<String, dynamic> jsonUserPicture) {
    return UserPicture(
        large: jsonUserPicture['large'],
        medium: jsonUserPicture['medium'],
        thumbnail: jsonUserPicture['thumbnail']);
  }
}
