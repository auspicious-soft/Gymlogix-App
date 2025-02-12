import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymlogix/features/base/data/datasources/gymlogix_ds.dart';
import 'package:gymlogix/features/base/data/repositories/remote_ds_impl.dart';
import 'package:gymlogix/features/base/domain/repositories/remote_repo.dart';
 
final remoteDataSourceProvider = Provider<RemoteDs>((ref) {
  return RemoteDs();
});

final remoteRepositoryProvider = Provider<RemoteRepo>((ref) {
  // final localDataSource = ref.read(remoteDataSourceProvider);
  final remoteDataSource = ref.read(remoteDataSourceProvider);
  return RemoteDsImpl(

      // localDataSource: localDataSource,

      remoteDataSource: remoteDataSource);
});
