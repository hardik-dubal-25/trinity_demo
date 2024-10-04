  

import '../imports.dart';

class AppPage {
  AppPage._();

  static final routes = [
    GetPage(name: AppRoute.routeSplash, page: () => const SplashScreen(), binding: SplashBinding()),

    // Auth
    GetPage(name: AppRoute.routeLogin, page: () => const LoginScreen(), binding: LoginBinding()),
    GetPage(name: AppRoute.routeDashboard, page: () => const DashboardScreen(), binding: DashboardBinding()),
    GetPage(name: AppRoute.routeContactDetails, page: () => const ContactDetailScreen(), binding: ContactDetailBinding()),
    GetPage(name: AppRoute.routeAddContact, page: () => const AddContactScreen(), binding: AddContactBinding()),
    
  ];
}
