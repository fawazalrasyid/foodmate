import 'package:get/get.dart';

import '../modules/add_to_journal/bindings/add_to_journal_binding.dart';
import '../modules/add_to_journal/views/add_to_journal_view.dart';
import '../modules/food/bindings/food_binding.dart';
import '../modules/food/views/food_view.dart';
import '../modules/form_pick_up/bindings/form_pick_up_binding.dart';
import '../modules/form_pick_up/views/form_pick_up_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/journal_history/bindings/journal_history_binding.dart';
import '../modules/journal_history/views/journal_history_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/pick_up_map/bindings/pick_up_map_binding.dart';
import '../modules/pick_up_map/views/pick_up_map_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/program/bindings/program_binding.dart';
import '../modules/program/views/program_view.dart';
import '../modules/resto/bindings/resto_binding.dart';
import '../modules/resto/views/resto_view.dart';
import '../modules/scan/bindings/scan_binding.dart';
import '../modules/scan/views/scan_view.dart';
import '../modules/scan_result/bindings/scan_result_binding.dart';
import '../modules/scan_result/views/scan_result_view.dart';
import '../modules/signin/bindings/signin_binding.dart';
import '../modules/signin/views/signin_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.SCAN,
      page: () => ScanView(),
      binding: ScanBinding(),
    ),
    GetPage(
      name: _Paths.SCAN_RESULT,
      page: () => const ScanResultView(),
      binding: ScanResultBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ADD_TO_JOURNAL,
      page: () => const AddToJournalView(),
      binding: AddToJournalBinding(),
    ),
    GetPage(
      name: _Paths.FORM_PICK_UP,
      page: () => const FormPickUpView(),
      binding: FormPickUpBinding(),
    ),
    GetPage(
      name: _Paths.PICK_UP_MAP,
      page: () => const PickUpMapView(),
      binding: PickUpMapBinding(),
    ),
    GetPage(
      name: _Paths.PROGRAM,
      page: () => const ProgramView(),
      binding: ProgramBinding(),
    ),
    GetPage(
      name: _Paths.FOOD,
      page: () => const FoodView(),
      binding: FoodBinding(),
    ),
    GetPage(
      name: _Paths.RESTO,
      page: () => const RestoView(),
      binding: RestoBinding(),
    ),
    GetPage(
      name: _Paths.JOURNAL_HISTORY,
      page: () => const JournalHistoryView(),
      binding: JournalHistoryBinding(),
    ),
  ];
}
