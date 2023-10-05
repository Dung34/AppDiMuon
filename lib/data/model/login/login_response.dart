class LoginResponse {
  String? idToken;
  String? refreshToken;

  LoginResponse({this.idToken, this.refreshToken});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    idToken = json['id_token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_token'] = this.idToken;
    data['refresh_token'] = this.refreshToken;
    return data;
  }
}
