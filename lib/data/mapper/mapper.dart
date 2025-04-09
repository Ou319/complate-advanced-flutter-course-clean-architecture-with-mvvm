import 'package:flutter_next_evel/app/extentions.dart';
import 'package:flutter_next_evel/data/response/responses.dart';
import 'package:flutter_next_evel/domain/modele/modeles.dart';

extension CustomoreResponseMapper on CustomoreResponse {
  Customore toDomain() {
    return Customore(
      id.orEmpty(), 
      name.orEmpty(),
      numberOfnotification.orZero(),
    );
  }
}
extension ContactsResponseMapper on ContactsResponse {
  Contacts toDomain() {
    return Contacts(
      phone.orZero(), 
      email.orEmpty(),
      link.orEmpty(),
    );
  }
  
}


extension AuthenticationResponseMapper on AuthenticationResponse {

  Authentication toDomain() {
    return Authentication(
      customore?.toDomain() ?? Customore("", "", 0), 
      contacts?.toDomain() ?? Contacts(0, "", ""),
    );
  }
  
}

