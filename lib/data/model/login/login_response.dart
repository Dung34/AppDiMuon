class LoginResponse {
  String? idToken;

  LoginResponse({this.idToken});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    idToken = json['id_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id_token'] = idToken;
    return data;
  }
}
