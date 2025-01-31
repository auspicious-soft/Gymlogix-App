import 'package:dartz/dartz.dart'; 
import 'package:gymlogix/features/domain/repositories/remote_repo.dart';

class SignupUsecase {
  final RemoteRepo fromRemoteRepo;

  SignupUsecase({required this.fromRemoteRepo});

  Future<Either<Failure, bool>> call( {required  Map<String, dynamic> body,
       }) {
    return fromRemoteRepo.signupNormal(body);
  }
}
