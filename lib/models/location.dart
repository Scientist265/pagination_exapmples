class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationStreet street;
  final LocationCoordinates coordinates;
  final LocationTimezone timezone;
  UserLocation(
      {required this.city,
      required this.state,
      required this.country,
      required this.postcode,
      required this.street,
      required this.coordinates,
      required this.timezone});
  factory UserLocation.fromMap(Map<String, dynamic> userLocation) {
    return UserLocation(
        city: userLocation['city'],
        state: userLocation['state'],
        country: userLocation['country'],
        postcode: userLocation['postcode'].toString(),
        street: userLocation['street'],
        coordinates: userLocation['coordinates'],
        timezone: userLocation['timezone']);
  }
}

class LocationStreet {
  final int streetNumber;
  final String streetName;
  LocationStreet({required this.streetName, required this.streetNumber});
  factory LocationStreet.fromMap(Map<String, dynamic> userStreet) {
    return LocationStreet(
        streetNumber: userStreet['number'],
        streetName: userStreet['name']);
  }
}

class LocationCoordinates {
  final String latitude;
  final String longitude;
  LocationCoordinates({required this.latitude, required this.longitude});
  factory LocationCoordinates.fromMap(Map<String, dynamic> userCoordinates) {
    return LocationCoordinates(
        latitude: userCoordinates['latitude'],
        longitude: userCoordinates['longitude']);
  }
}

class LocationTimezone {
  final String offset;
  final String description;
  LocationTimezone({required this.offset, required this.description});
  factory LocationTimezone.fromMap(Map<String, dynamic> timeZone) {
    return LocationTimezone(
        offset: timeZone['offset'], description: timeZone['description']);
  }
}
