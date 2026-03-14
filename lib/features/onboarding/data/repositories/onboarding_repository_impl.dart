import '../../domain/entities/onboarding_content.dart';
import '../../domain/repositories/onboarding_repository.dart';
import '../datasources/onboarding_local_data_source.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  OnboardingRepositoryImpl(this.localDataSource);

  final OnboardingLocalDataSource localDataSource;

  @override
  List<OnboardingContent> getOnboardingContent() {
    return localDataSource.getOnboardingContent();
  }
}
