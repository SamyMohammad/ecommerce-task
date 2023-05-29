import 'package:ecommerce_task/data/repositories/profile_repository/profile_repo.dart';

import '../../remote/data_sources/remote_data_source.dart';
import '../../remote/network/network_info.dart';

class ProfileRepoImpl implements ProfileRepo {
  final RemoteDataSourceImpl _remoteDataSource;
  final NetworkInfo _networkInfo;

  // final BehaviorSubject<User?> _userSubject = BehaviorSubject();
  ProfileRepoImpl(this._remoteDataSource, this._networkInfo
      // this._localDataSource
      );
}
