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
import 'package:fashionapp/features/notification/data/datasources/notification_local_data_source.dart';
import 'package:fashionapp/features/notification/data/datasources/notification_remote_data_source.dart';
import 'package:fashionapp/features/notification/data/repositories/notification_repository_impl.dart';
import 'package:fashionapp/features/notification/domain/repositories/notification_repository.dart';
import 'package:fashionapp/features/notification/domain/usecases/mark_notification_read.dart';
import 'package:fashionapp/features/notification/presentation/controllers/notification_notifier.dart';
import 'package:fashionapp/features/profile/data/datasources/profile_local_data_source.dart';
import 'package:fashionapp/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:fashionapp/features/profile/domain/repositories/profile_repository.dart';
import 'package:fashionapp/features/profile/domain/usecases/get_profile_user.dart';
import 'package:fashionapp/features/profile/domain/usecases/has_access_token.dart';
import 'package:fashionapp/features/profile/domain/usecases/logout.dart';
import 'package:fashionapp/features/profile/presentation/controllers/profile_notifier.dart';
import 'package:fashionapp/features/wishlist/data/datasources/wishlist_local_data_source.dart';
import 'package:fashionapp/features/wishlist/data/datasources/wishlist_remote_data_source.dart';
import 'package:fashionapp/features/wishlist/data/repositories/wishlist_repository_impl.dart';
import 'package:fashionapp/features/wishlist/domain/repositories/wishlist_repository.dart';
import 'package:fashionapp/features/wishlist/domain/usecases/get_wishlist_ids.dart';
import 'package:fashionapp/features/wishlist/domain/usecases/toggle_wishlist.dart';
import 'package:fashionapp/features/wishlist/presentation/controllers/wishlist_notifier.dart';
import 'package:fashionapp/features/searchview/data/datasources/search_remote_data_source.dart';
import 'package:fashionapp/features/searchview/data/repositories/search_repository_impl.dart';
import 'package:fashionapp/features/searchview/domain/repositories/search_repository.dart';
import 'package:fashionapp/features/searchview/domain/usecases/search_products.dart';
import 'package:fashionapp/features/searchview/presentation/controllers/search_notifier.dart';
import 'package:fashionapp/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:fashionapp/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:fashionapp/features/auth/domain/repositories/auth_repository.dart';
import 'package:fashionapp/features/auth/presentation/controllers/auth_notifier.dart';
import 'package:fashionapp/features/categories/presentation/controller/category_notifier.dart';
import 'package:fashionapp/features/cart/presentation/controllers/color_size_notifier.dart';
import 'package:fashionapp/features/home/presentation/controller/navigation_page_notifier.dart';
import 'package:fashionapp/features/onboarding/presentation/controllers/onboard_change_notifier.dart';
import 'package:fashionapp/features/products/presentation/controller/product_notifier.dart';
import 'package:fashionapp/features/home/presentation/controller/tab_controller_notifier.dart';
import 'package:fashionapp/core/base/styles/app_theme.dart';
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
        Provider<WishlistRepository>(
          create: (_) => WishlistRepositoryImpl(
            remoteDataSource: WishlistRemoteDataSource(client: http.Client()),
            localDataSource: WishlistLocalDataSource(GetStorage()),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistNotifier(
            getWishlistIds: GetWishlistIds(
              context.read<WishlistRepository>(),
            ),
            toggleWishlist: ToggleWishlist(
              context.read<WishlistRepository>(),
            ),
          ),
        ),
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
        Provider<ProfileRepository>(
          create: (context) => ProfileRepositoryImpl(
            ProfileLocalDataSource(
              authRepository: context.read<AuthRepository>(),
              storage: GetStorage(),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileNotifier(
            getProfileUser: GetProfileUser(context.read<ProfileRepository>()),
            hasAccessToken:
                HasAccessToken(context.read<ProfileRepository>()),
            logout: Logout(context.read<ProfileRepository>()),
          ),
        ),
        Provider<NotificationRepository>(
          create: (_) => NotificationRepositoryImpl(
            remoteDataSource: NotificationRemoteDataSource(client: http.Client()),
            localDataSource: NotificationLocalDataSource(GetStorage()),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => NotificationNotifier(
            markNotificationRead: MarkNotificationRead(
              context.read<NotificationRepository>(),
            ),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

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
          theme: AppTheme.lightTheme,
          routerConfig: router,
        );
      },
      child: const RootApp(),
    );
  }
}

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

