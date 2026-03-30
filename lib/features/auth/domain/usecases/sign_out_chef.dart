import '../repositories/auth_repository.dart';

class SignOutChef {
  final AuthRepository repository;

  SignOutChef(this.repository);

  Future<void> call() async {
    return await repository.signOut();
  }
}
