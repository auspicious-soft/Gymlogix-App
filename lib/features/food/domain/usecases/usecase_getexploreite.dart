 
import 'package:dartz/dartz.dart';
import 'package:gymlogix/features/data/datasources/network_error.dart';
import 'package:gymlogix/features/food/data/repositories/explorerepo.dart';
import 'package:gymlogix/features/food/domain/entities/exploreitem.dart';

class UsecaseGetexploreite {
  final ExploreRepository repository;

  UsecaseGetexploreite(this.repository);

   Future<Either<NetworkAPIStatus, List<ExploreItem>?>> execute() {
    return repository.getItems();
  }
}
