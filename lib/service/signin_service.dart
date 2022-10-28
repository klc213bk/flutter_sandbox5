import '../model/user.dart';

class SigninService {
  Future<User> signin() async {
    await Future.delayed(const Duration(seconds: 1));
    return User();
  }
}
