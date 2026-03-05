import 'package:rms_shared_package/models/staff_model/staff_model.dart';
import '../repositories/auth_repository.dart';

class SignInChef {
  final AuthRepository repository;

  SignInChef(this.repository);

  Future<StaffModel?> call(String email, String password) async {
    return await repository.signIn(email, password);
  }
}
