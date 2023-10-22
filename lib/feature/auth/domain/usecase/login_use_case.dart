import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/feature/auth/domain/entity/login.dart';
import 'package:pharmcy_app/feature/auth/domain/repositry/authrepositry.dart';

import '../../../../error/failure.dart';

class LoginUseCase {
  AuthRepositry authRepositry;
  LoginUseCase({required this.authRepositry});
  Future<Either<Failure, Unit>> call(Login login) async {
    return await authRepositry.login(login);
  }
}
