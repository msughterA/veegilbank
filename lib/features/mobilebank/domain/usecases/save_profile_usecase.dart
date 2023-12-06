import 'package:veegilbank/core/usecase/usecase.dart';
import 'package:veegilbank/features/mobilebank/data/models/signup.dart';
import 'package:veegilbank/features/mobilebank/domain/repository/auth_repository.dart';

class SaveProfileUseCase implements UseCase<void, SignUpModel?> {
  final AuthRepository _authRepository;
  SaveProfileUseCase(
    this._authRepository,
  );
  @override
  Future<void> call({SignUpModel? params}) {
    // TODO: implement call
    return _authRepository.saveProfileToCache(params!);
  }
}
