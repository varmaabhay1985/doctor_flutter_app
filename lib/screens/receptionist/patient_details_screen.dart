import 'package:doctor_app/models/patient_model.dart';
import 'package:doctor_app/resources/color_manager.dart';
import 'package:doctor_app/resources/styles_manager.dart';
import 'package:doctor_app/routes/app_routes.dart';
import 'package:doctor_app/services/api_services.dart';
import 'package:doctor_app/utils/validator_utils.dart';
import 'package:doctor_app/widgets/get_button_widget.dart';
import 'package:doctor_app/widgets/get_textformfield_widget.dart';
import 'package:doctor_app/widgets/get_textformfield_widget1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PatientDetailsScreen extends StatelessWidget {
  PatientDetailsScreen({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _medDetails = TextEditingController();
  final TextEditingController _latestMedDetails = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  APIServices _apiServices = APIServices();
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: ColorManager.tertiary, size: 20),
        ),
      ),
      backgroundColor: ColorManager.primary,
      body: Center(
        child: SizedBox(
          width: width * .4,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Patient Registration Form",
                      style: getBoldStyle(
                        color: ColorManager.tertiary,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 15),
                    GetTextFormFieldWidget(
                      inputcontroller: _nameController,
                      hintText: "Full Name of Patient",
                      validator: ValidationForm.validateField,
                      //width: width * .4,
                    ),
                    const SizedBox(height: 15),
                    GetTextFormFieldWidget(
                      inputcontroller: _emailController,
                      hintText: "Enter Patient Email",
                      validator: ValidationForm.validateEmail,
                      //width: width * .4,
                    ),
                    const SizedBox(height: 15),
                    GetTextFormFieldWidget(
                      inputcontroller: _phoneController,
                      inputFormat: [FilteringTextInputFormatter.digitsOnly],
                      hintText: "Enter Patient Phone Number",
                      validator: ValidationForm.validateField,
                      //width: width * .4,
                    ),
                    const SizedBox(height: 15),
                    GetTextFormFieldWidget(
                      inputcontroller: _addressController,
                      hintText: "Enter Patient Address",
                      validator: ValidationForm.validateField,
                      //width: width * .4,
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.maxFinite,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 300.0),
                        child: TextFormField(
                          controller: _medDetails,
                          maxLines: 250,

                          validator: ValidationForm.validateField,

                          /*  onTap: () {
                        FocusScopeNode currentFocus = FocusScope.of(context);

                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                                }, */
                          style: getMediumStyle(
                            color: ColorManager.policyTextColor,
                            fontSize: 12,
                          ),
                          decoration: InputDecoration(
                            //errorStyle: const TextStyle(fontSize: 0.01),
                            errorStyle: getRegularStyle(
                              color: ColorManager.rateColor,
                              fontSize: 12,
                            ),
                            errorMaxLines: 1,
                            errorBorder: InputBorder.none,
                            contentPadding: const EdgeInsets.only(
                              top: 21,
                              bottom: 21,
                              left: 16,
                            ),
                            hintText: "Patient Medical Details",
                            hintStyle: getMediumStyle(
                              color: ColorManager.policyTextColor,
                              fontSize: 12,
                            ),
                            isDense: true,

                            fillColor: ColorManager.primary,
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorManager.tertiary,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorManager.tertiary,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorManager.tertiary,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.maxFinite,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 300.0),
                        child: TextFormField(
                          controller: _latestMedDetails,
                          maxLines: 250,

                          //validator: ValidationForm.validateField,

                          /*  onTap: () {
                        FocusScopeNode currentFocus = FocusScope.of(context);

                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                                }, */
                          style: getMediumStyle(
                            color: ColorManager.policyTextColor,
                            fontSize: 12,
                          ),
                          decoration: InputDecoration(
                            //errorStyle: const TextStyle(fontSize: 0.01),
                            errorStyle: getRegularStyle(
                              color: ColorManager.rateColor,
                              fontSize: 12,
                            ),
                            errorMaxLines: 1,
                            errorBorder: InputBorder.none,
                            contentPadding: const EdgeInsets.only(
                              top: 21,
                              bottom: 21,
                              left: 16,
                            ),
                            hintText: "Latest Medicines Prescribed by Doctor",
                            hintStyle: getMediumStyle(
                              color: ColorManager.policyTextColor,
                              fontSize: 12,
                            ),
                            isDense: true,

                            fillColor: ColorManager.primary,
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorManager.tertiary,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorManager.tertiary,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorManager.tertiary,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.maxFinite,
                      child: GetButtonWidget(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            PatientModel pm = PatientModel(
                              email: _emailController.text.trim(),
                              name: _nameController.text.trim(),
                              phnNumber: _phoneController.text.trim(),
                              address: _addressController.text.trim(),
                              medDetails: _medDetails.text.trim(),
                              latestMedDetails: _latestMedDetails.text.trim(),
                            );
                            await _apiServices.addPatient(pm);
                            Get.offAllNamed(AppRoutes.recHomeScreen);
                          }
                        },
                        btnText: "Submit",
                        btnColor: ColorManager.secondary,
                        btnTextColor: ColorManager.tertiary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
