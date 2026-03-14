import 'package:fashionapp/common/utils/kstrings.dart';
import '../models/onboarding_content_model.dart';

class OnboardingLocalDataSource {
  const OnboardingLocalDataSource();

  List<OnboardingContentModel> getOnboardingContent() {
    return const [
      OnboardingContentModel(
        imageAsset: 'assets/images/experience.png',
        message: AppText.kOnboardHome,
      ),
      OnboardingContentModel(
        imageAsset: 'assets/images/wishlist.png',
        message: AppText.kOnboardWishListMessage,
      ),
    ];
  }
}
