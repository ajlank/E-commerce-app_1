import 'package:fashionapp/common/utils/kcolors.dart';
import 'package:fashionapp/src/onboardingscreen/widgets/onboarding_page1.dart';
import 'package:fashionapp/src/onboardingscreen/widgets/onboarding_page2.dart';
import 'package:fashionapp/src/onboardingscreen/widgets/welcom_page.dart';
import 'package:fashionapp/statemanagement/onboard_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
   
   late final PageController _pageController;

   @override
  void initState() {
    _pageController=PageController(
      initialPage: context.read<OnboardChangeNotifier>().selectedPage
    );
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (value) {
              context.read<OnboardChangeNotifier>().setSelectedPage=value;
            },
            children: [
              OnboardingPage1(),
              OnboardingPage2(),
              WelcomePage()
            ],
          ),
         (context.watch<OnboardChangeNotifier>().selectedPage==2)?SizedBox.shrink(): Positioned(
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
                 context.watch<OnboardChangeNotifier>().selectedPage==0?SizedBox.shrink():
                 GestureDetector(
                  onTap: () {
                    _pageController.animateToPage(
                      context.read<OnboardChangeNotifier>().selectedPage-1,
                       duration:  const Duration(microseconds: 200), curve: Curves.easeIn);
                  },
                child: Icon(Icons.arrow_circle_left, color: Kolors.kPrimary, size: 30,)),
                   SizedBox(
                    height: 100,
                    width: 100,
                    child: PageViewDotIndicator(
                      currentItem: context.watch<OnboardChangeNotifier>().selectedPage,
                      count: 3,
                      unselectedColor:Colors.black26 ,
                      selectedColor: Kolors.kPrimary,
                      duration: const Duration(microseconds: 200),
                      onItemClicked: (index) {
                        _pageController.animateToPage(
                          index, duration: const Duration(microseconds: 200), curve: Curves.easeInOut);
                      },
                    ),
                   ),
                   context.watch<OnboardChangeNotifier>().selectedPage==2?SizedBox.shrink():
                   GestureDetector(
                    onTap: () {
                     _pageController.animateToPage(
                      context.read<OnboardChangeNotifier>().selectedPage+1 ,
                      duration: const Duration(microseconds: 200), 
                      curve: Curves.easeIn);
                    },
                    child: Icon(Icons.arrow_circle_right, color: Kolors.kPrimary, size: 30,))
                  ],
                ),
              ),
            ),
            )
        ],
      )
    );
  }
}