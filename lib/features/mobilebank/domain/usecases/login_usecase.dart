import 'package:veegilbank/core/resources/data_state.dart';
import 'package:veegilbank/core/usecase/usecase.dart';
import 'package:veegilbank/features/mobilebank/domain/entities/token.dart';
import 'package:veegilbank/features/mobilebank/domain/repository/auth_repository.dart';

class LoginUseCase
    implements UseCase<DataState<TokenEntity>, Map<String, dynamic>> {
  final AuthRepository _authRepository;
  LoginUseCase(this._authRepository);
  @override
  Future<DataState<TokenEntity>> call({Map<String, dynamic>? params}) {
    // TODO: implement call
    return _authRepository.login(params!);
  }
}
