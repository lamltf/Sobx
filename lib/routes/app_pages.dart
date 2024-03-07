import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sobx/constants/key_constant.dart';
import 'package:sobx/dashboard/dashboard_screen.dart';
import 'package:sobx/features/forgot/forgot_password_screen.dart';
import 'package:sobx/features/home/home_screen.dart';
import 'package:sobx/features/login/screen/login_screen.dart';
import 'package:sobx/features/login/screen/signup_signin_screen.dart';
import 'package:sobx/features/otp/otp_screen.dart';
import 'package:sobx/features/profile/profile_sceent.dart';
import 'package:sobx/routes/app_routes.dart';
import 'package:sobx/splash/loading_screen.dart';
import 'package:sobx/splash/onboarding_screen.dart';

class AppPages {
  static String getCurrentState() {
    return Routes.loading;
  }

  static final routes = [
    GetPage(name: Routes.loading, page: () => const LoadingScreen()),
    GetPage(name: Routes.onboarding, page: () => const OnboardingScreen()),
    GetPage(name: Routes.login, page: () => LoginScreen()),
    GetPage(name: Routes.home, page: () => HomeScreen()),
    GetPage(name: Routes.signUp, page: () => SignUpSignInScreen()),
    GetPage(name: Routes.signIn, page: () => SignUpSignInScreen()),
    GetPage(name: Routes.dashboard, page: () => const DashboardScreen()),
    GetPage(name: Routes.profileFill, page: () => ProfileScreenFill()),
    GetPage(name: Routes.profilePin, page: () => ProfileScreenPin()),
    GetPage(
        name: Routes.profileFingerprint,
        page: () => ProfileScreenFignerprint()),
    GetPage(
        name: Routes.forgotPassword,
        page: () => ForgotPassowrdScreen(isFromSignIn: true)),
    GetPage(
        name: Routes.resetPassword,
        page: () => ForgotPassowrdScreen(isFromSignIn: false)),
    GetPage(name: Routes.createNewPassword, page: () => NewPassowrdScreen()),
    GetPage(name: Routes.otp, page: () => OTPScreen()),
  ];
}
