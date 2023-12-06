import 'package:veegilbank/core/usecase/usecase.dart';
import 'package:veegilbank/features/mobilebank/data/models/signup.dart';
import 'package:veegilbank/features/mobilebank/domain/repository/auth_repository.dart';

class GetSavedProfileUseCase implements UseCase<SignUpModel, void> {
  final AuthRepository _authRepository;
  GetSavedProfileUseCase(this._authRepository);

  @override
  Future<SignUpModel> call({void params}) async {
    // TODO: implement call
    return _authRepository.getProfileFromCache();
  }
}
