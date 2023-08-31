
class UserName {
  final String title;
  final String firstName;
  final String lastName;
  UserName({
    required this.title,
    required this.firstName,
    required this.lastName,
  });
 factory UserName.fromMap(Map<String, dynamic> jsonUserName ){
  return  UserName(
        title: jsonUserName['title'],
        firstName: jsonUserName['first'],
        lastName: jsonUserName['last']);
 }
}
