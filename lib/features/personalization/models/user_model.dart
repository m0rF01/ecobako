import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecobako_app/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String username;
  String homeAddress;
  String postal;
  String country;
  String gender;
  String age;
  final String email;
  String phoneNo;
  String profilePicture;

  UserModel({
    required this.id, 
    required this.firstName,  
    required this.lastName, 
    required this.username,
    required this.homeAddress, 
    required this.postal, 
    required this.country, 
    required this.gender, 
    required this.age, 
    required this.email,
    required this.phoneNo, 
    required this.profilePicture, 
    });

  // helper fx to get full name
  String get fullName => "$firstName $lastName";

  // helper fx to format phone number
  String get formattedPhoneNumber => BakoFormatter.formattedPhoneNumber(phoneNo);

  // Static function to split full name and last name 
  static List<String> nameParts(fullName) => fullName.split("");

  // Static function to generate username from the fullname
  static String generateUsername(fullName){
    List<String> nameParts = fullName.split("");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  // static function to create an empty user model
  static UserModel empty() => UserModel(
    id: "",
    firstName: "", 
    lastName: "",
    username: "",
    homeAddress: "",
    postal: "",
    country: "",
    gender: "",
    age: "",
    email: "",
    phoneNo: "",
    profilePicture: "",
  );


  // convert model to JSON structure for storing data in firebase
  Map<String, dynamic> toJson() {
    return {
      "FirstName": firstName,
      "LastName": lastName,
      "Username": username,
      "Address": homeAddress,
      "PostalCode": postal,
      "Country": country,
      "Gender": gender,
      "Age" : age,
      "Email": email,
      "PhoneNumber": phoneNo,
      "ProfilePicture": profilePicture,
    };
  }

  // factory method to create a UserModel from a firebase document snapshot

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null){
      final data = document.data()!;
      return UserModel (
        id: document.id,
        firstName: data["FirstName"] ?? "",
        lastName: data["LastName"] ?? "",
        username: data["Username"] ?? "",
        homeAddress: data["Address"] ?? "",
        postal: data["PostalCode"] ?? "",
        country: data["Country"] ?? "",
        gender: data["Gender"] ?? "",
        age: data["Age"] ?? "",
        email: data["Email"] ?? "",
        phoneNo: data["PhoneNumber"] ?? "",
        profilePicture: data["profilePicture"] ?? "",
      );
    } else {
      throw Exception("Document data is null");
    }
  }
}