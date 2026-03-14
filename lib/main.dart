import 'package:fashionapp/common/utils/app_routes.dart';
import 'package:fashionapp/common/utils/kstrings2.dart';
import 'package:fashionapp/features/address/data/datasources/address_remote_data_source.dart';
import 'package:fashionapp/features/address/data/repositories/address_repository_impl.dart';
import 'package:fashionapp/features/address/domain/repositories/address_repository.dart';
import 'package:fashionapp/features/address/presentation/controllers/address_notifier.dart';
import 'package:fashionapp/features/cart/data/datasources/cart_remote_data_source.dart';
import 'package:fashionapp/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:fashionapp/features/cart/domain/repositories/cart_repository.dart';
import 'package:fashionapp/features/cart/presentation/controllers/cart_notifier.dart';
import 'package:fashionapp/features/searchview/data/datasources/search_remote_data_source.dart';
import 'package:fashionapp/features/searchview/data/repositories/search_repository_impl.dart';
import 'package:fashionapp/features/searchview/domain/repositories/search_repository.dart';
import 'package:fashionapp/features/searchview/domain/usecases/search_products.dart';
import 'package:fashionapp/features/searchview/presentation/controllers/search_notifier.dart';
import 'package:fashionapp/src/notifications/controller/notification_notifier.dart';
import 'package:fashionapp/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:fashionapp/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:fashionapp/features/auth/domain/repositories/auth_repository.dart';
import 'package:fashionapp/features/auth/presentation/controllers/auth_notifier.dart';
import 'package:fashionapp/statemanagement/category_notifier.dart';
import 'package:fashionapp/statemanagement/color_size_notifier.dart';
import 'package:fashionapp/statemanagement/navigation_page_notifier.dart';
import 'package:fashionapp/statemanagement/onboard_change_notifier.dart';
import 'package:fashionapp/statemanagement/product_notifier.dart';
import 'package:fashionapp/statemanagement/tab_controller_notifier.dart';
import 'package:fashionapp/src/wishlist/statemanagement/wishlist_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

// 10:11:26
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OnboardChangeNotifier()),
        ChangeNotifierProvider(create: (context) => NavigationPageNotifier()),
        ChangeNotifierProvider(create: (context) => CategoryNotifier()),
        ChangeNotifierProvider(create: (context) => TabControllerNotifier()),
        ChangeNotifierProvider(create: (context) => ProductNotifier()),
        ChangeNotifierProvider(create: (context) => ColorSizeNotifier()),
        Provider<AuthRepository>(
          create: (_) => AuthRepositoryImpl(
            remoteDataSource: AuthRemoteDataSource(
              client: http.Client(),
            ),
            storage: GetStorage(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthNotifier(
            repository: context.read<AuthRepository>(),
          ),
        ),
        Provider<SearchRepository>(
          create: (_) => SearchRepositoryImpl(
            SearchRemoteDataSource(client: http.Client()),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchNotifier(
            searchProducts: SearchProducts(
              context.read<SearchRepository>(),
            ),
          ),
        ),
        ChangeNotifierProvider(create: (context) => WishlistNotifier()),
        Provider<CartRepository>(
          create: (_) => CartRepositoryImpl(
            remoteDataSource: CartRemoteDataSource(
              client: http.Client(),
              storage: GetStorage(),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => CartNotifier(
            repository: context.read<CartRepository>(),
          ),
        ),
        Provider<AddressRepository>(
          create: (_) => AddressRepositoryImpl(
            remoteDataSource: AddressRemoteDataSourceImpl(
              client: http.Client(),
              storage: GetStorage(),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => AddressNotifier(
            repository: context.read<AddressRepository>(),
          ),
        ),
        ChangeNotifierProvider(create: (context) => NotificationNotifier()),
      ],
      child: const MyApp(),
    ),
  );
}

//3:32:48
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
      designSize: screenSize,
      minTextAdapt: true,
      splitScreenMode: false,
      useInheritedMediaQuery: true,
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: AppTxt.appName,
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

// 12345678Abc#@
//1234567Fashionh
class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: const Center(child: Text("Welcome to Fashion App")),
    );
  }
}

//9:43:08
