// To parse this JSON data, do
//
//     final users = usersFromMap(jsonString);

import 'dart:convert';

Users usersFromMap(String str) => Users.fromMap(json.decode(str));

String usersToMap(Users data) => json.encode(data.toMap());

class Users {
    final int? userId;
    final String? usrName;
    final String? fullName;
    final String? email;
    final String password;

    Users({
       this.userId,
       this.usrName,
       this.fullName,
       this.email,
       required this.password,
    });
    factory Users.fromMap(Map<String, dynamic> json) => Users(
        userId: json["userId"],
        usrName: json["userName"],
        fullName: json["fullName"],
        email: json["email "],
        password: json["password"],
    );

    Map<String, dynamic> toMap() => {
        "userId": userId,
        "usrName": usrName,
        "fullName": fullName,
        "email ": email,
        "password": password,
    };
}
