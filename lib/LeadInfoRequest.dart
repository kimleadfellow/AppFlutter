class LeadInfoRequest{
  final String message;
  final String error;
  final String referrer_email;
  final String lead_status;

  const LeadInfoRequest({
    required this.message,
    required this.error,
    required this.referrer_email,
    required this.lead_status,
  });
  factory LeadInfoRequest.fromJson(Map<String, dynamic> json) {
    return LeadInfoRequest(
      message: json['message'],
      error: json['error'],
      referrer_email: json['referrer_email'],
      lead_status: json['lead_status'],
    );
  }
}