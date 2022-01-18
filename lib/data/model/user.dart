class User{
  int? id;
  String? email;
  String? username;
  String? phone;

  User({
    this.id,
    this.email,
    this.username,
    this.phone
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    username: json["username"],
    phone: json["phone"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "username": username,
    "phone": phone
  };
}