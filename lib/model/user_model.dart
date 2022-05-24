class Model {
  String? name;
  String? uId;
  String? email;
  Model({required this.uId, required this.email});

  Model.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    uId = json['uId'];
    name = json['name'];
  }
  Map<String, dynamic> tomap() {
    return {
      'email': email,
      'uId': uId,
      'name': name,
    };
  }
}
