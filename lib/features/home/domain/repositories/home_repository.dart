abstract class HomeRepository {
  Future<void> updateLastActiveStatus(String uid, DateTime time);
}
