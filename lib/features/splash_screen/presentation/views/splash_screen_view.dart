import 'package:fashionapp/features/splash_screen/data/datasources/splash_local_data_source.dart';
import 'package:fashionapp/features/splash_screen/data/repositories/splash_repository_impl.dart';
import 'package:fashionapp/features/splash_screen/domain/usecases/get_next_route.dart';
import 'package:fashionapp/core/base/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    _navigate();
    super.initState();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 2));
    final repository = SplashRepositoryImpl(
      SplashLocalDataSource(GetStorage()),
    );
    final nextRoute = await GetNextRoute(repository)();
    if (!mounted) {
      return;
    }
    GoRouter.of(context).go(nextRoute);
  }

  @override
  Widget build(BuildContext context) {
    final appColors =
        Theme.of(context).extension<AppColors>() ?? AppColors.light;
    return Scaffold(
      backgroundColor: appColors.splashBackground,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splashscreen.png'),
          ),
        ),
      ),
    );
  }
}
