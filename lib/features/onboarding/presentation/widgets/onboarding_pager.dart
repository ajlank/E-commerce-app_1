import 'package:fashionapp/features/onboarding/domain/entities/onboarding_content.dart';
import 'package:fashionapp/features/onboarding/presentation/widgets/onboarding_content_page.dart';
import 'package:fashionapp/features/onboarding/presentation/widgets/welcome_page.dart';
import 'package:flutter/material.dart';

class OnboardingPager extends StatelessWidget {
  const OnboardingPager({
    super.key,
    required this.controller,
    required this.pages,
    required this.onPageChanged,
  });

  final PageController controller;
  final List<OnboardingContent> pages;
  final ValueChanged<int> onPageChanged;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      onPageChanged: onPageChanged,
      children: [
        ...pages.map(
          (content) => OnboardingContentPage(content: content),
        ),
        const WelcomePage(),
      ],
    );
  }
}
