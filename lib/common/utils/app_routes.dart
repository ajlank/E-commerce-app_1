// ignore_for_file: unused_element
import 'package:fashionapp/src/auth/login_view.dart';
import 'package:fashionapp/src/entrypoint/views/app_entry_point_view.dart';
import 'package:fashionapp/src/entrypoint/views/navigationviews/categories/all_categories_views.dart';
import 'package:fashionapp/src/entrypoint/views/navigationviews/categories/category_view.dart';
import 'package:fashionapp/src/entrypoint/views/navigationviews/searchpage/search_page_view.dart';
import 'package:fashionapp/src/entrypoint/views/notification_views.dart';
import 'package:fashionapp/src/onboardingscreen/views/onboarding_screen.dart';
import 'package:fashionapp/src/splashscreen/views/splash_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter _router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreenView(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => AppEntryPointView()
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(path: '/login',
    builder: (context, state) => const LoginView(),
    ),
    GoRoute(path: '/notifications',
    builder: (context, state) => const NotificationViews(),
    ),
    GoRoute(path: '/search',
    builder: (context, state) =>SearchPageView()
    ),
    GoRoute(path: '/allcategories',
     builder: (context, state) => AllCategoriesViews(),
    ),
    GoRoute(path: '/category',
    builder: (context, state) => CategoryView(),
    )
    // GoRoute(
    //   path: '/review',
    //   builder: (context, state) => const ReviewsPage(),
    // ),
    // GoRoute(
    //   path: '/policy',
    //   builder: (context, state) => const PolicyPage(),
    // ),
    // GoRoute(
    //   path: '/verification',
    //   builder: (context, state) => const VerificationPage(),
    // ),
    // GoRoute(
    //   path: '/search',
    //   builder: (context, state) => const SearchPage(),
    // ),
    // GoRoute(
    //   path: '/help',
    //   builder: (context, state) => const HelpCenterPage(),
    // ),
    // GoRoute(
    //   path: '/orders',
    //   builder: (context, state) => const OrdersPage(),
    // ),

    // GoRoute(
    //   path: '/register',
    //   builder: (context, state) => const RegistrationPage(),
    // ),
    // GoRoute(
    //   path: '/categories',
    //   builder: (context, state) => const CategoriesPage(),
    // ),
    //  GoRoute(
    //   path: '/category',
    //   builder: (context, state) => const CategoryPage(),
    // ),

    // GoRoute(
    //   path: '/addaddress',
    //   builder: (context, state) => const AddAddress(),
    // ),

    // GoRoute(
    //   path: '/addresses',
    //   builder: (context, state) => const AddressesListPage(),
    // ),

    //  GoRoute(
    //   path: '/notifications',
    //   builder: (context, state) => const NotificationPage(),
    // ),

    //  GoRoute(
    //   path: '/tracking',
    //   builder: (context, state) => const TrackOrderPage(),
    // ),

    // GoRoute(
    //   path: '/checkout',
    //   builder: (context, state) => const CheckoutPage(),
    // ),

    //   GoRoute(
    //   path: '/successful',
    //   builder: (context, state) => const SuccessfulPayment(),
    // ),

    //   GoRoute(
    //   path: '/failed',
    //   builder: (context, state) => const FailedPayment(),
    // ),

    // GoRoute(
    //   path: '/product/:id',
    //   builder: (BuildContext context, GoRouterState state) {
    //     final productId = state.pathParameters['id'];
    //     return ProductPage(productId: productId.toString());
    //   },
    // ),
  ],
);

GoRouter get router => _router;
