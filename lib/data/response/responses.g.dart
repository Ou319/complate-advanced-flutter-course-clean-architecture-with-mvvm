// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) {
  return BaseResponse()
    ..status = json['status'] as int?
    ..message = json['message'] as String?;
}

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

CustomoreResponse _$CustomoreResponseFromJson(Map<String, dynamic> json) {
  return CustomoreResponse()
    ..id = json['id'] as int?
    ..name = json['name'] as String?
    ..numberOfnotification = json['numberOfnotification'] as int?;
}

Map<String, dynamic> _$CustomoreResponseToJson(CustomoreResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'numberOfnotification': instance.numberOfnotification,
    };

ContactsResponse _$ContactsResponseFromJson(Map<String, dynamic> json) {
  return ContactsResponse()
    ..phone = json['phone'] as int?
    ..email = json['email'] as String?
    ..link = json['link'] as String?;
}

Map<String, dynamic> _$ContactsResponseToJson(ContactsResponse instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'email': instance.email,
      'link': instance.link,
    };

AuthenticationResponse _$AuthenticationResponseFromJson(
    Map<String, dynamic> json) {
  return AuthenticationResponse(
    json['contacts'] == null
        ? null
        : ContactsResponse.fromJson(json['contacts'] as Map<String, dynamic>),
    json['customore'] == null
        ? null
        : CustomoreResponse.fromJson(json['customore'] as Map<String, dynamic>),
  )
    ..status = json['status'] as int?
    ..message = json['message'] as String?;
}

Map<String, dynamic> _$AuthenticationResponseToJson(
        AuthenticationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'customore': instance.customore,
      'contacts': instance.contacts,
    };