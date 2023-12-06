import 'package:veegilbank/core/usecase/usecase.dart';
import 'package:veegilbank/features/mobilebank/domain/repository/auth_repository.dart';

class CheckCacheUseCase implements UseCase<bool, void> {
  final AuthRepository _authRepository;
  CheckCacheUseCase(this._authRepository);

  @override
  Future<bool> call({void params}) async {
    return _authRepository.checkCache();
  }
}
