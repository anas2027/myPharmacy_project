import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/feature/auth/domain/entity/login.dart';

import '../../../../error/failure.dart';

abstract class AuthRepositry {
  Future<Either<Failure, Unit>> login(Login login);
}
