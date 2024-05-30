import 'package:get/get.dart';
import 'package:neuro_care_hub_app/pages/Admin/admin_home.dart';
import 'package:neuro_care_hub_app/pages/User/about_page.dart';
import 'package:neuro_care_hub_app/pages/Admin/admin_login.dart';
import 'package:neuro_care_hub_app/pages/Admin/admin_braindata_page.dart';
import 'package:neuro_care_hub_app/pages/User/alzheimer_detection_page.dart';
import 'package:neuro_care_hub_app/pages/User/contact_us_page.dart';
import 'package:neuro_care_hub_app/pages/User/home_page.dart';
import 'package:neuro_care_hub_app/pages/Authentication/sign_up_page.dart';
import 'package:neuro_care_hub_app/pages/User/splash_page.dart';
import 'package:neuro_care_hub_app/pages/User/brain_tumor_detection_page.dart';

import '../pages/Authentication/login_page.dart';

class AppRoutes {
  static const INITIAL = '/';
  static const LOGIN = '/login';
  static const SIGNUP = '/signup';
  static const HOME = '/home';
  static const HELP = '/help';
  static const ABOUT = '/about';
  static const BTD = '/btd';
  static const AD = '/ad';
  static const PROFILE = '/profile';
  static const ADMINHOME = '/adminhome';
  static const ADMINLOGIN = '/adminlogin';
  static const ADMINBRNDATA = '/adminbraindata';

  static final routes = [
    GetPage(
      name: INITIAL,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: SIGNUP,
      page: () => SignUpPage(),
    ),
    GetPage(
      name: LOGIN,
      page: () => LoginPage(),
    ),
    GetPage(
      name: HOME,
      page: () => const HomePage(),
    ),
    GetPage(
      name: ABOUT,
      page: () => const AboutPage(),
    ),
    GetPage(
      name: HELP,
      page: () => const HelpPage(),
    ),
    GetPage(
      name: BTD,
      page: () => BrainTumorDetectionPage(),
    ),
    GetPage(
      name: AD,
      page: () => AlzheimerDetectionPage(),
    ),
    GetPage(
      name: ADMINHOME,
      page: () => const AdminHome(),
    ),
    GetPage(
      name: ADMINLOGIN,
      page: () => AdminLogin(),
    ),
    GetPage(name: ADMINBRNDATA, page: () => const AdminBrainDataScreen()),
  ];
}
