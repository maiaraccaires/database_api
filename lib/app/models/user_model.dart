import 'dart:convert';

class UserModel {
  final int? id;
  final String fullname;
  final String email;
  final String password;
  final String document;
  final String? username;
  final String? phone;
  final Address? address;
  final String? website;
  final Company? company;
  final String terms;

  UserModel({
    this.id,
    required this.fullname,
    required this.email,
    required this.password,
    required this.document,
    required this.terms,
    this.username,
    this.phone,
    this.address,
    this.website,
    this.company,
  });

  @override
  String toString() {
    return 'UserModel(id: $id, fullname: $fullname, email: $email, password: $password, phone: $phone, document: $document, address: $address, website: $website, company: $company)';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullname': fullname,
      'email': email,
      'password': password,
      'phone': phone,
      'document': document,
      'address': address?.toMap(),
      'website': website,
      'company': company?.toMap(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id']?.toInt() ?? 0,
      fullname: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['token'] ?? '',
      username: map['username'] ?? '',
      phone: map['phone'] ?? '',
      document: map['document'] ?? '',
      address: map['address'] != null ? Address.fromMap(map['address']) : null,
      website: map['website'],
      company: map['company'] != null ? Company.fromMap(map['company']) : null,
      terms: map['termApproved'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  Map<String, dynamic> toMap() {
    return {
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
      'geo': geo?.toMap(),
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      street: map['street'],
      suite: map['suite'],
      city: map['city'],
      zipcode: map['zipcode'],
      geo: map['geo'] != null ? Geo.fromMap(map['geo']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Address(street: $street, suite: $suite, city: $city, zipcode: $zipcode, geo: $geo)';
  }
}

class Geo {
  String? lat;
  String? lng;

  Geo({this.lat, this.lng});

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }

  factory Geo.fromMap(Map<String, dynamic> map) {
    return Geo(
      lat: map['lat'],
      lng: map['lng'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Geo.fromJson(String source) => Geo.fromMap(json.decode(source));

  @override
  String toString() => 'Geo(lat: $lat, lng: $lng)';
}

class Company {
  String? name;
  String? catchPhrase;
  String? bs;

  Company({this.name, this.catchPhrase, this.bs});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'catchPhrase': catchPhrase,
      'bs': bs,
    };
  }

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      name: map['name'],
      catchPhrase: map['catchPhrase'],
      bs: map['bs'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Company.fromJson(String source) =>
      Company.fromMap(json.decode(source));

  @override
  String toString() =>
      'Company(name: $name, catchPhrase: $catchPhrase, bs: $bs)';
}
