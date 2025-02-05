 import 'package:dartz/dartz.dart';
import 'package:gymlogix/features/data/models/login_model.dart';

import '../../../domain/repositories/remote_repo.dart';

abstract class FoodRepo {
  Future<Either<Failure, dynamic>> createNewFood(String email, String pass);
  
}
