import 'package:veegilbank/core/usecase/usecase.dart';

import '../repository/auth_repository.dart';

class ClearCacheUseCase implements UseCase<void, void> {
  final AuthRepository _authRepository;
  ClearCacheUseCase(this._authRepository);
  @override
  Future<void> call({void params}) {
    return _authRepository.clearCache();
  }
}
