import 'package:chef_portal/features/home/domain/repositories/home_repository.dart';

class UpdateLastActiveUseCase {
  final HomeRepository repository;

  UpdateLastActiveUseCase(this.repository);

  Future<void> call(String uid, DateTime time) async {
    return await repository.updateLastActiveStatus(uid, time);
  }
}
