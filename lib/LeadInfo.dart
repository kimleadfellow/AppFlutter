import 'dart:ffi';

class LeadInfo{
  final String token;
  final String company;
  final String person_first;
  final String person_last;
  final String phone;
  final String phone_area_code;
  final String email;
  final String info;
  final String commission;
  final Array provider_emails;

  const LeadInfo({
    required this.token,
    required this.company,
    required this.person_first,
    required this.person_last,
    required this.phone,
    required this.phone_area_code,
    required this.email,
    required this.info,
    required this.commission,
    required this.provider_emails
  });
  factory LeadInfo.fromJson(Map<String, dynamic> json) {
    return LeadInfo(
      token: json['token'],
      company: json['company'],
      person_first: json['person_first'],
      person_last: json['person_last'],
      phone: json['phone'],
      phone_area_code: json['phone_area_code'],
      email: json['email'],
      info: json['info'],
      commission: json['commission'],
      provider_emails: json['provider_emails']
    );
  }
}