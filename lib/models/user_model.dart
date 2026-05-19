import 'package:cineluxe/models/movie_response.dart';

class UserModel {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? avatar;
  List<Movies>? isWatchlist;
  List<Movies>? isHistory;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.avatar,
    this.isWatchlist,
    this.isHistory,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    avatar = json['avatar'];
    isWatchlist = json['isWatchlist'];
    isHistory = json['isHistory'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'avatar': avatar,
      'isWatchlist': isWatchlist,
      'isHistory': isHistory,
    };
  }
}