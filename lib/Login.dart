class Login{
  final String message;
  final int status;
  final String token;
  final String email;
  final int expiresAt;

  const Login({
    required this.message,
    required this.status,
    required this.token,
    required this.email,
    required this.expiresAt,
  });
  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      message: json['message'],
      status: json['status'],
      token: json['token'],
      email: json['email'],
      expiresAt: json['expiresAt'],
    );
  }
}