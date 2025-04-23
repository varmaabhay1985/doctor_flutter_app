import 'dart:convert';
import 'dart:math';

import 'package:doctor_app/constants/constants.dart';
import 'package:doctor_app/models/full_patient_model.dart';
import 'package:doctor_app/models/patient_model.dart';
import 'package:doctor_app/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class APIServices {
  loginWithAPI(String email, String password, String userType) async {
    String endpoint = "getuser";
    var json = {"email": email, "pwd": password, "user_type": userType};
    var response = await http.post(
      Uri.parse(baseURL + endpoint),
      body: jsonEncode(json),
    );
    print(response.statusCode);
    print(jsonDecode(response.body));
    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = jsonDecode(response.body);
      print(data["userType"]);
      box.write('userType', data["userType"]);
      if (data["userType"] == "Receptionist") {
        Get.offAllNamed(AppRoutes.recHomeScreen);
      } else {
        Get.offAllNamed(AppRoutes.docHomeScreen);
      }
    }
  }

  addPatient(PatientModel pm) async {
    String endpoint = "patients";
    var response = await http.post(
      Uri.parse(baseURL + endpoint),
      body: jsonEncode(pm.toJson()),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(jsonDecode(response.body));
    }
  }

  Future<List<FullPatientModel>>? getAllPatients() async {
    String endpoint = "getallpatients";
    List<FullPatientModel> pm = [];
    var response = await http.get(Uri.parse(baseURL + endpoint));
    if (response.statusCode == 200 || response.statusCode == 201) {
      jsonDecode(response.body).forEach((v) {
        pm.add(FullPatientModel.fromJson(v));
      });
    }
    return pm;
  }

  deletePatient(String email) async {
    String endpoint = "deletepatientbyemail";
    var response = await http.delete(
      Uri.parse(baseURL + endpoint + "/$email"),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(jsonDecode(response.body));
    }
  }

  updatePatient(FullPatientModel fpm) async {
    String endpoint = "updatepatient";
    var response = await http.put(
      Uri.parse(baseURL + endpoint),
      body: jsonEncode(fpm.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(jsonDecode(response.body));
    }
  }
}
