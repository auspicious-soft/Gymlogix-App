import 'package:dartz/dartz.dart';
import 'package:gymlogix/features/data/models/login_model.dart';

import 'package:gymlogix/features/domain/repositories/remote_repo.dart';

class UsecaseLogin {
  final RemoteRepo repository;

  UsecaseLogin({required this.repository});

  Future<Either<Failure, LoginModel>> call(
      {required String email, required String pass}) {
    return repository.login(email, pass);
  }
}
