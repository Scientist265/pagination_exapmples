class UserDob {
  final DateTime date;
  final int age;
  UserDob({required this.date, required this.age});
factory UserDob.fromMap(Map<String,dynamic> userDob){
   final date = userDob['date'];
  return UserDob(
    
      date: DateTime.parse(date),
      age: userDob['age'],
    );
}
}
