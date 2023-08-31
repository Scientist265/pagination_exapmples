import 'package:flutter_api_call/models/location.dart';
import 'package:flutter_api_call/models/user_dob.dart';
import 'package:flutter_api_call/models/user_picture.dart';
import 'package:flutter_api_call/models/username_model.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String nat;
  final UserName name;
  final UserDob dob;
  final UserLocation loc;
  final UserPicture pic;
  User({
    required this.pic,
    required this.loc,
    required this.gender,
    required this.email,
    required this.phone,
    required this.nat,
    required this.name,
    required this.dob,
  });
  factory User.fromMap(Map<String, dynamic> data) {
// objects of json datas
    final picture = UserPicture.fromMap(data['picture']);
    final userName = UserName.fromMap(data['name']);
     final dob = UserDob.fromMap(data['dob']);

    final coordinate = LocationCoordinates(
        latitude: data['location']['coordinates']['latitude'],
        longitude: data['location']['coordinates']['longitude']);

    // objects of timezone from json
    final timeZone = LocationTimezone(
        offset: data['location']['timezone']['offset'],
        description: data['location']['timezone']['description']);

    // objects of street from json
    final streetValue = LocationStreet(
        streetName: data['location']['street']['name'],
        streetNumber: data['location']['street']['number']);

// objects of location from json
    final loc = UserLocation(
        city: data['location']['city'],
        state: data['location']['state'],
        country: data['location']['country'],
        postcode: data['location']['postcode'].toString(),
        street: streetValue,
        coordinates: coordinate,
        timezone: timeZone);
    // final loc = UserLocation.fromMap(data['location']);
   
    return User(
        gender: data['gender'],
        email: data['email'],
        phone: data['cell'],
        nat: data['nat'],
        name: userName,
        dob: dob,
        loc: loc,
        pic: picture);
  }

  String get fullName {
    return '${name.firstName} ${name.lastName}';
  }
}
