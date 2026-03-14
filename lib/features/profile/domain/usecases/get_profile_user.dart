import 'package:fashionapp/features/auth/domain/entities/user.dart';
import '../repositories/profile_repository.dart';

class GetProfileUser {
  GetProfileUser(this.repository);

  final ProfileRepository repository;

  User? call() {
    return repository.getCachedUser();
  }
}
