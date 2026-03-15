import 'package:fashionapp/features/onboarding/data/datasources/onboarding_local_data_source.dart';
import 'package:fashionapp/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:fashionapp/features/onboarding/domain/usecases/get_onboarding_content.dart';
import 'package:fashionapp/features/onboarding/presentation/controllers/onboard_change_notifier.dart';
import 'package:fashionapp/features/onboarding/presentation/widgets/onboarding_controls.dart';
import 'package:fashionapp/features/onboarding/presentation/widgets/onboarding_pager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: context.read<OnboardChangeNotifier>().selectedPage,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final repository = OnboardingRepositoryImpl(
      const OnboardingLocalDataSource(),
    );
    final pages = GetOnboardingContent(repository)();
    final selectedPage =
        context.watch<OnboardChangeNotifier>().selectedPage;

    return Scaffold(
      body: Stack(
        children: [
          OnboardingPager(
            controller: _pageController,
            pages: pages,
            onPageChanged: (value) {
              context.read<OnboardChangeNotifier>().setSelectedPage = value;
            },
          ),
          OnboardingControls(
            controller: _pageController,
            selectedPage: selectedPage,
            pagesLength: pages.length,
          ),
        ],
      ),
    );
  }
}
