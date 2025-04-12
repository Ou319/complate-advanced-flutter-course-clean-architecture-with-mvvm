import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_data_class.freezed.dart';

@freezed
class LoginObject with _$LoginObject {
  factory LoginObject(String username, String password) = _LoginObject;
  
  @override
  // TODO: implement password
  String get password => throw UnimplementedError();
  
  @override
  // TODO: implement username
  String get username => throw UnimplementedError();
}

// Run the following command to generate the necessary files:
// flutter pub run build_runner build