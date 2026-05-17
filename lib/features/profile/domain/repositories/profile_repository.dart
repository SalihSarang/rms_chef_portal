abstract class ProfileRepository {
  Future<void> updateLastActiveStatus(String uid, DateTime time);
}
