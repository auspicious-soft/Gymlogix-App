import 'package:dartz/dartz.dart'; 
import 'package:gymlogix/features/base/data/datasources/network_error.dart';
import 'package:gymlogix/features/food/data/models/explore_model.dart'; 
import 'package:gymlogix/features/food/domain/entities/exploreitem.dart';
 
class ExploreRepository {
  Future<Either<NetworkAPIStatus, List<ExploreItem>?>> getItems() async {
    // Mock API call
    await Future.delayed(Duration(seconds: 2)); 
    print("here calling");
  //  return left(NetworkAPIStatus.failedToProcess);
    return right([
      //tesmoc()
      ExploreModel(id: "1", title: "Mountain"),
      ExploreModel(id: "2", title: "Beach"),
    ]);
  }
}

dynamic tesmoc( ) {
  return 0;
}
