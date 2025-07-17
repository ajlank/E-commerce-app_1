import 'package:fashionapp/common/utils/app_routes.dart';
import 'package:fashionapp/common/utils/kstrings2.dart';
import 'package:fashionapp/statemanagement/auth_notifier.dart';
import 'package:fashionapp/statemanagement/category_notifier.dart';
import 'package:fashionapp/statemanagement/color_size_notifier.dart';
import 'package:fashionapp/statemanagement/navigation_page_notifier.dart';
import 'package:fashionapp/statemanagement/onboard_change_notifier.dart';
import 'package:fashionapp/statemanagement/product_notifier.dart';
import 'package:fashionapp/statemanagement/search_notifier.dart';
import 'package:fashionapp/statemanagement/tab_controller_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OnboardChangeNotifier()),
        ChangeNotifierProvider(create: (context)=>NavigationPageNotifier()),
        ChangeNotifierProvider(create: (context)=>CategoryNotifier()),
        ChangeNotifierProvider(create: (context)=>TabControllerNotifier()),
        ChangeNotifierProvider(create: (context)=>ProductNotifier()),
        ChangeNotifierProvider(create: (context)=>ColorSizeNotifier()),
        ChangeNotifierProvider(create: (context)=>AuthNotifier()),
        ChangeNotifierProvider(create: (context)=>SearchNotifier())

      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    return ScreenUtilInit(
      designSize: screenSize,
      minTextAdapt: true,
      splitScreenMode: false,
      useInheritedMediaQuery: true,
      builder: (_,child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title:AppTxt.appName,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          routerConfig: router,
          
        );
      },
    child: const RootApp(),
    );
    
  }
}
//1234567Fashionh
class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: const Center(
        child: Text("Welcome to Fashion App"),
      ),
    );
  }
}
// 1:23:49