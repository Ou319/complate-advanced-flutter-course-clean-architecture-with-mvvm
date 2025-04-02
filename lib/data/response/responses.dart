
import 'package:json_annotation/json_annotation.dart';



part 'responses.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  int? status;

  @JsonKey(name:"message")
  String? message;


  
  BaseResponse({this.status, this.message});

  

}


@JsonSerializable()
class CustomoreResponse {
  @JsonKey(name:"id")
  int? id;
  @JsonKey(name:"name")
  String? name;
  @JsonKey(name:"numberOfnotification")
  int? numberOfnotification;

     CustomoreResponse({this.id, this.name, this.numberOfnotification});

  //from json

  factory CustomoreResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomoreResponseFromJson(json);
  

  //to json
  

  Map<String, dynamic> toJson() => _$CustomoreResponseToJson(this);
}
@JsonSerializable()
class ContactsResponse{
  @JsonKey(name:"phone")
  int? phone;
  @JsonKey(name:"email")
  String? email;
  @JsonKey(name:"link")
  String? link;

   ContactsResponse({this.phone, this.email, this.link});

  //from json


  factory ContactsResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactsResponseFromJson(json);
  //to json
  
  Map<String, dynamic> toJson() => _$ContactsResponseToJson(this);

}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse {
  @JsonKey(name: "customore")
  CustomoreResponse? customore;

  @JsonKey(name: "contacts")
  ContactsResponse? contacts;

  AuthenticationResponse({this.customore, this.contacts});


  //from json
  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);


  //to json
  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}