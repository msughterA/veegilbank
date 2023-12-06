import 'package:veegilbank/core/resources/data_state.dart';
import 'package:veegilbank/core/usecase/usecase.dart';
import 'package:veegilbank/features/mobilebank/domain/entities/signup.dart';
import 'package:veegilbank/features/mobilebank/domain/repository/auth_repository.dart';

class SignUpUseCase
    implements UseCase<DataState<SignUpEntity>, Map<String, dynamic>> {
  final AuthRepository _authRepository;
  SignUpUseCase(this._authRepository);
  @override
  Future<DataState<SignUpEntity>> call({Map<String, dynamic>? params}) {
    // TODO: implement call
    return _authRepository.signUp(params!);
  }
}
