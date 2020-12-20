import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
class Customer {
  final int id;
  final int addressId;
  final String companyName;
  final String companyContactFullName;
  final String companyContactPhone;
  final String companyContactEmail;
  final String companyDescription;
  final String technicalAuthorityFullName;
  final String technicalAuthorityPhoneNumber;
  final String technicalManagerEmailService;
  final DateTime createdAt;
  final DateTime updatedAt;

  Customer({
    @required this.id,
    @required this.addressId,
    @required this.companyName,
    @required this.companyContactFullName,
    @required this.companyContactPhone,
    @required this.companyContactEmail,
    @required this.companyDescription,
    @required this.technicalAuthorityFullName,
    @required this.technicalAuthorityPhoneNumber,
    @required this.technicalManagerEmailService,
    @required this.createdAt,
    @required this.updatedAt
  });

  factory Customer.fromJson(Map<String,dynamic> json) {
    return Customer(
      id: json{'Id'} as int, 
      addressId: json{'address_id'} as int, 
      companyName: json{'company_name'} as String, 
      companyContactFullName: json{'company_contact_full_name'} as String, 
      companyContactPhone: json{'company_contact_phone'} as String, 
      companyContactEmail: json{'company_contact_email'} as String, 
      companyDescription: json{'company_description'} as String, 
      technicalAuthorityFullName: json{'technical_authority_full_name'} as String, 
      technicalAuthorityPhoneNumber: json{'technical_authority_phone_number'} as String, 
      technicalManagerEmailService: json{'technical_manager_email_service'} as String, 
      createdAt: json{'created_at'} as String, 
      updatedAt: json{'updated_at'} as String
    );
  }

}
