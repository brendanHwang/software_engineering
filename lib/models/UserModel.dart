class UserModel {
  String name;
  String email;
  String password;
  String? passwordApprove;


  UserModel({
    required this.name,
    required this.email,
    required this.password,
  });

  // Firebase Document로부터 UserModel 생성
  factory UserModel.fromDocument(Map<String, dynamic> doc) {
    return UserModel(
      name: doc['name'],
      email: doc['email'], // 이메일로 사용될 수 있습니다.
      password: doc['password'],
    );
  }

  // UserModel을 Map으로 변환
  Map<String, dynamic> toSignupDocument() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
