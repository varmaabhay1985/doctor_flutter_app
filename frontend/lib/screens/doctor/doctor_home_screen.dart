import 'package:doctor_app/constants/constants.dart';
import 'package:doctor_app/models/full_patient_model.dart';
import 'package:doctor_app/models/patient_model.dart';
import 'package:doctor_app/resources/color_manager.dart';
import 'package:doctor_app/resources/styles_manager.dart';
import 'package:doctor_app/routes/app_routes.dart';
import 'package:doctor_app/services/api_services.dart';
import 'package:doctor_app/widgets/get_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorHomeScreen extends StatefulWidget {
  DoctorHomeScreen({super.key});

  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  List<PatientModel> _pd = [
    PatientModel(
      name: "Sudheer",
      email: "su@gmail.com",
      phnNumber: "9980981234",
    ),
    PatientModel(
      name: "Raghav Gowda",
      email: "raghav@gmail.com",
      phnNumber: "9980912345",
    ),
    PatientModel(
      name: "Chandini Sharma",
      email: "cs@yahoo.com",
      phnNumber: "9980954321",
    ),
  ];
  APIServices _apiServices = APIServices();

  Future<List<FullPatientModel>>? myFuture;

  String? userType;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userType = box.read("userType");
    myFuture = _apiServices.getAllPatients();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        elevation: 0,
        title: Text(
          "Welcome $userType - List of Patients",
          style: getBoldStyle(color: ColorManager.tertiary, fontSize: 22),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.offAllNamed(AppRoutes.loginScreen);
            },
            icon: Icon(Icons.logout, color: ColorManager.tertiary, size: 30),
          ),
        ],
      ),
      body: FutureBuilder<List<FullPatientModel>>(
        future: myFuture,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasData) {
                List<FullPatientModel> fpm = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 15),
                      Container(
                        width: width,

                        decoration: BoxDecoration(
                          color: ColorManager.secondary,
                          border: Border.all(
                            color: ColorManager.tertiary,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              //width: width * .16,
                              child: Text(
                                "Sl. No.",
                                style: getMediumStyle(
                                  color: ColorManager.tertiary,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Expanded(
                              //width: width * .16,
                              child: Text(
                                "Patient Name",
                                style: getMediumStyle(
                                  color: ColorManager.tertiary,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Expanded(
                              //width: width * .16,
                              child: Text(
                                "Patient Email",
                                style: getMediumStyle(
                                  color: ColorManager.tertiary,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Expanded(
                              //width: width * .16,
                              child: Text(
                                "Patient Phone",
                                style: getMediumStyle(
                                  color: ColorManager.tertiary,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            /*Expanded(
                        //width: width * .16,
                        child: Text(
                          "Updated By",
                          style: getMediumStyle(
                            color: ColorManager.tertiary,
                            fontSize: 16,
                          ),
                        ),
                      ),*/
                            Expanded(
                              //width: width * .2,
                              child: Text(
                                "Actions",
                                style: getMediumStyle(
                                  color: ColorManager.tertiary,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Flexible(
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return getPatientList(index, fpm[index]);
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              color: ColorManager.tertiary,
                              thickness: 2,
                            );
                          },
                          itemCount: fpm.length,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Text(
                    "No Patients Found",
                    style: getSemiBoldStyle(
                      color: ColorManager.tertiary,
                      fontSize: 16,
                    ),
                  ),
                );
              }
            default:
              return Center(
                child: Text(
                  "No Data",
                  style: getSemiBoldStyle(
                    color: ColorManager.tertiary,
                    fontSize: 16,
                  ),
                ),
              );
          }
        },
      ),
    );
  }

  getPatientList(int index, FullPatientModel pm) {
    return Row(
      children: [
        Expanded(
          child: Text(
            index.toString(),
            style: getRegularStyle(color: ColorManager.tertiary, fontSize: 14),
          ),
        ),
        Expanded(
          child: Text(
            pm.name!,
            style: getRegularStyle(color: ColorManager.tertiary, fontSize: 14),
          ),
        ),
        Expanded(
          child: Text(
            pm.email!,
            style: getRegularStyle(color: ColorManager.tertiary, fontSize: 14),
          ),
        ),
        Expanded(
          child: Text(
            pm.phnNumber!,
            style: getRegularStyle(color: ColorManager.tertiary, fontSize: 14),
          ),
        ),
        /*Expanded(
          child: Text(
            "Receptionist",
            style: getRegularStyle(color: ColorManager.tertiary, fontSize: 14),
          ),
        ),*/
        Expanded(
          child: GetButtonWidget(
            onPressed: () {
              Get.toNamed(AppRoutes.patientEditScreen, arguments: {'fpm': pm});
            },
            btnText: "Update",
            height: 45,
            btnColor: ColorManager.secondary,
            btnTextColor: ColorManager.tertiary,
          ),
        ),
      ],
    );
  }
}
