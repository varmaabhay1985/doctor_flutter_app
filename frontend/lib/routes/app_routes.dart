import 'package:doctor_app/screens/doctor/doctor_home_screen.dart';
import 'package:doctor_app/screens/login_screen.dart';
import 'package:doctor_app/screens/receptionist/patient_details_screen.dart';
import 'package:doctor_app/screens/receptionist/patient_edit_screen.dart';
import 'package:doctor_app/screens/receptionist/receptionist_home_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String loginScreen = '/login';
  static const String recHomeScreen = '/recHomeScreen';
  static const String docHomeScreen = '/docHomeScreen';
  static const String patientDetailsScreen = '/patientDetailsScreen';
  static const String patientEditScreen = '/patientEditScreen';

  static List<GetPage> pages = [
    GetPage(
      name: loginScreen,
      transition: Transition.rightToLeft,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: recHomeScreen,
      transition: Transition.rightToLeft,
      page: () => ReceptionistHomeScreen(),
    ),
    GetPage(
      name: patientDetailsScreen,
      transition: Transition.rightToLeft,
      page: () => PatientDetailsScreen(),
    ),
    GetPage(
      name: docHomeScreen,
      transition: Transition.rightToLeft,
      page: () => DoctorHomeScreen(),
    ),
    GetPage(
      name: patientEditScreen,
      transition: Transition.rightToLeft,
      page: () => PatientEditScreen(fpm: Get.arguments['fpm']),
    ),
  ];
}
