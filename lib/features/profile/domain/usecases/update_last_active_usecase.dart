import 'package:chef_portal/features/profile/domain/repositories/profile_repository.dart';

class UpdateLastActiveUseCase {
  final ProfileRepository repository;

  UpdateLastActiveUseCase(this.repository);

  Future<void> call({required String uid, required DateTime time}) async {
    return await repository.updateLastActiveStatus(uid, time);
  }
}
