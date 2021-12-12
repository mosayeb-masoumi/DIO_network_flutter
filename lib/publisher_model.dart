import 'package:equatable/equatable.dart';

// class PublisherModel extends Equatable {
// class PublisherModel  {
//   final String createdAt;
//   final String name;
//   final String avatar;
//   final String id;
//
//   const PublisherModel({
//     required this.createdAt,
//     required this.name,
//     required this.avatar,
//     required this.id
//   });
//
//
//   // static Future<List<PublisherModel>> fromJson(data) {}
//
// factory PublisherModel.fromJson(Map<String, dynamic> json) =>
//       PublisherModel(
//         createdAt: json['createdAt'],
//         name: json['name'],
//         avatar: json['avatar'],
//         id: json['id'],
//       );
//
//   @override
//   // TODO: implement props
//   List<Object> get props => [createdAt, name, avatar, id];
// }


import 'package:json_annotation/json_annotation.dart';



@JsonSerializable()
class PublisherModel {

  final String createdAt;
  final String name;
  final String avatar;
  final String id;




  PublisherModel({
    required this.createdAt,
    required this.name,
    required this.avatar,
    required this.id
  });



  // factory PublisherModel.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  // Map<String, dynamic> toJson() => _$DataToJson(this);


  factory PublisherModel.fromJson(Map<String, dynamic> json) => PublisherModel(
    createdAt: json['createdAt'],
    name: json['name'],
    avatar: json['avatar'],
    id: json['id'],
  );

  @override
  List<Object> get props => [createdAt, name, avatar, id];

}