import 'package:doctor_app/resources/color_manager.dart';
import 'package:doctor_app/resources/styles_manager.dart';
import 'package:doctor_app/routes/app_routes.dart';
import 'package:doctor_app/services/api_services.dart';
import 'package:doctor_app/utils/validator_utils.dart';
import 'package:doctor_app/widgets/get_button_widget.dart';
import 'package:doctor_app/widgets/get_textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum LoginBy { doctor, receptionist }

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _pwdController = TextEditingController();

  LoginBy? _selectedVal;
  final _formKey = GlobalKey<FormState>();
  APIServices _apiServices = APIServices();

  String getRoleDescription(LoginBy role) {
    switch (role) {
      case LoginBy.doctor:
        return 'Doctor';
      case LoginBy.receptionist:
        return 'Receptionist';
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Material(
          elevation: 10,
          child: Container(
            width: width * .45,
            height: height * .8,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ColorManager.primary,
              border: Border.all(color: ColorManager.primary, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Login",
                    style: getBoldStyle(
                      color: ColorManager.tertiary,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 15),
                  GetTextFormFieldWidget(
                    inputcontroller: _emailController,
                    hintText: "Email",
                    validator: ValidationForm.validateEmail,
                  ),
                  const SizedBox(height: 15),
                  GetTextFormFieldWidget(
                    inputcontroller: _pwdController,
                    hintText: "Password",
                    obscureField: true,
                    fieldType: "Pwd",
                    validator: ValidationForm.validatePassword,
                  ),
                  const SizedBox(height: 15),
                  FormField(
                    validator: (value) {
                      if (_selectedVal == null) {
                        return 'Please select a value';
                      }
                      return null;
                    },
                    builder: (FormFieldState<bool> state) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Radio(
                                value: LoginBy.doctor,
                                groupValue: _selectedVal,
                                onChanged: (LoginBy? value) {
                                  setState(() {
                                    _selectedVal = value!;
                                  });
                                },
                              ),
                              Text(
                                "Doctor",
                                style: getMediumStyle(
                                  color: ColorManager.tertiary,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Radio(
                                value: LoginBy.receptionist,
                                groupValue: _selectedVal,
                                onChanged: (LoginBy? value) {
                                  setState(() {
                                    _selectedVal = value!;
                                  });
                                },
                              ),
                              Text(
                                "Receptionist",
                                style: getMediumStyle(
                                  color: ColorManager.tertiary,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          state.hasError
                              ? Text(
                                state.errorText!,
                                style: getRegularStyle(
                                  color: ColorManager.rateColor,
                                  fontSize: 12,
                                ),
                              )
                              : Container(),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  GetButtonWidget(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await _apiServices.loginWithAPI(
                          _emailController.text.trim(),
                          _pwdController.text.trim(),
                          getRoleDescription(_selectedVal!),
                        );
                        // Get.offAllNamed(AppRoutes.docHomeScreen);
                      }
                    },
                    btnText: "Login",
                    btnColor: ColorManager.secondary,
                    btnTextColor: ColorManager.tertiary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
