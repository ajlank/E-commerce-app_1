import 'package:fashionapp/common/utils/kcolors.dart';
import 'package:fashionapp/features/onboarding/data/datasources/onboarding_local_data_source.dart';
import 'package:fashionapp/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:fashionapp/features/onboarding/domain/usecases/get_onboarding_content.dart';
import 'package:fashionapp/features/onboarding/presentation/controllers/onboard_change_notifier.dart';
import 'package:fashionapp/features/onboarding/presentation/widgets/onboarding_content_page.dart';
import 'package:fashionapp/features/onboarding/presentation/widgets/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
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

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (value) {
              context.read<OnboardChangeNotifier>().setSelectedPage = value;
            },
            children: [
              ...pages.map(
                (content) => OnboardingContentPage(content: content),
              ),
              const WelcomePage(),
            ],
          ),
          (context.watch<OnboardChangeNotifier>().selectedPage ==
                  pages.length)
              ? const SizedBox.shrink()
              : Positioned(
                  bottom: 50,
                  child: SizedBox(
                    height: 50,
                    width: ScreenUtil().screenWidth,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          context.watch<OnboardChangeNotifier>().selectedPage ==
                                  0
                              ? const SizedBox.shrink()
                              : GestureDetector(
                                  onTap: () {
                                    _pageController.animateToPage(
                                      context
                                              .read<OnboardChangeNotifier>()
                                              .selectedPage -
                                          1,
                                      duration:
                                          const Duration(microseconds: 200),
                                      curve: Curves.easeIn,
                                    );
                                  },
                                  child: Icon(
                                    Icons.arrow_circle_left,
                                    color: Kolors.kPrimary,
                                    size: 30,
                                  ),
                                ),
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: PageViewDotIndicator(
                              currentItem: context
                                  .watch<OnboardChangeNotifier>()
                                  .selectedPage,
                              count: pages.length + 1,
                              unselectedColor: Colors.black26,
                              selectedColor: Kolors.kPrimary,
                              duration: const Duration(microseconds: 200),
                              onItemClicked: (index) {
                                _pageController.animateToPage(
                                  index,
                                  duration: const Duration(microseconds: 200),
                                  curve: Curves.easeInOut,
                                );
                              },
                            ),
                          ),
                          context.watch<OnboardChangeNotifier>().selectedPage ==
                                  pages.length
                              ? const SizedBox.shrink()
                              : GestureDetector(
                                  onTap: () {
                                    _pageController.animateToPage(
                                      context
                                              .read<OnboardChangeNotifier>()
                                              .selectedPage +
                                          1,
                                      duration:
                                          const Duration(microseconds: 200),
                                      curve: Curves.easeIn,
                                    );
                                  },
                                  child: Icon(
                                    Icons.arrow_circle_right,
                                    color: Kolors.kPrimary,
                                    size: 30,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
