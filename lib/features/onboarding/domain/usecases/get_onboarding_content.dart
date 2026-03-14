import '../entities/onboarding_content.dart';
import '../repositories/onboarding_repository.dart';

class GetOnboardingContent {
  GetOnboardingContent(this.repository);

  final OnboardingRepository repository;

  List<OnboardingContent> call() {
    return repository.getOnboardingContent();
  }
}
