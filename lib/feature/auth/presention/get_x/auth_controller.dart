import 'package:get/get.dart';
import 'package:pharmcy_app/feature/auth/domain/entity/login.dart';
import 'package:pharmcy_app/feature/auth/domain/usecase/login_use_case.dart';

class AuthController extends GetxController {
  final LoginUseCase loginUseCase;

  AuthController({required this.loginUseCase});
  Future login(String email, String password) async {
    Login login;
    login = Login(email: email, password: password);
    await loginUseCase(login);
  }
}
