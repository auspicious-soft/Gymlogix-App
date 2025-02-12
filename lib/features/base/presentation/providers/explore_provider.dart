import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymlogix/features/food/data/repositories/explorerepo.dart';

import '../../../food/domain/usecases/usecase_getexploreite.dart';
 
// final exploreRepositoryProvider = Provider((ref) => ExploreRepository());

// final getExploreItemsProvider = Provider((ref) {
//   final repo = ref.watch(exploreRepositoryProvider);
//   return GetExploreItems(repo);
// });

// final exploreItemsProvider = FutureProvider((ref) async {
//   final useCase = ref.watch(getExploreItemsProvider);
//   return useCase.execute();
// });

//To fetch 
 //final exploreAsync = ref.watch(exploreItemsProvider);
