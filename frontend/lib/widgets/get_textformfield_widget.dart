import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:doctor_app/resources/color_manager.dart';
import 'package:doctor_app/resources/styles_manager.dart';

class GetTextFormFieldWidget extends StatefulWidget {
  GetTextFormFieldWidget({
    Key? key,
    required this.inputcontroller,
    this.hintText,
    this.obscureField = false,
    this.keyBoardType = TextInputType.text,
    this.fieldActive = true,
    this.autoFocus = false,
    this.validator,
    this.fieldType = "Normal",
    this.onChanged,
    this.inputFormat,
    this.maxLines,
    this.maxLength1,
    this.width,
  }) : super(key: key);
  final TextEditingController inputcontroller;
  final String? hintText;
  bool obscureField;
  TextInputType keyBoardType;
  bool fieldActive;
  bool autoFocus;
  String? Function(String?)? validator;
  String fieldType;
  List<TextInputFormatter>? inputFormat;
  int? maxLines;
  int? maxLength1;
  double? width;
  void Function(String)? onChanged;

  @override
  State<GetTextFormFieldWidget> createState() => _GetTextFormFieldWidgetState();
}

class _GetTextFormFieldWidgetState extends State<GetTextFormFieldWidget> {
  bool vis = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.maxFinite,
      height: 60,
      child: TextFormField(
        inputFormatters: widget.inputFormat,
        autofocus: widget.autoFocus,
        controller: widget.inputcontroller,
        enabled: widget.fieldActive,
        maxLines: widget.maxLines ?? 1,
        maxLength: widget.maxLength1 ?? null,
        validator: widget.validator,
        onChanged: widget.onChanged,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        /*  onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        }, */
        textAlignVertical: TextAlignVertical.center,
        //textAlign: TextAlign.center,
        obscureText:
            widget.fieldType == "Pwd" && vis == true
                ? false
                : widget.fieldType == "Pwd" && vis == false
                ? true
                : false,
        keyboardType: widget.keyBoardType,
        style: getMediumStyle(
          color: ColorManager.policyTextColor,
          fontSize: 12,
        ),
        decoration: InputDecoration(
          constraints: const BoxConstraints(minHeight: 47),
          //errorStyle: const TextStyle(fontSize: 0.01),
          errorStyle: getRegularStyle(
            color: ColorManager.rateColor,
            fontSize: 12,
          ),
          errorMaxLines: 1,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.rateColor),
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          contentPadding: const EdgeInsets.only(top: 21, bottom: 21, left: 16),
          hintText: widget.hintText,
          hintStyle: getMediumStyle(
            color: ColorManager.policyTextColor,
            fontSize: 12,
          ),
          isDense: true,
          suffixIcon:
              widget.obscureField
                  ? Container(
                    height: 47,
                    child: GestureDetector(
                      child: Icon(
                        vis ? Icons.visibility : Icons.visibility_off,
                        color: ColorManager.hintTextColor,
                        size: 25,
                      ),
                      onTap: () {
                        setState(() {
                          vis = !vis;
                        });
                      },
                    ),
                  )
                  : Container(height: 47, child: Text("")),
          fillColor: ColorManager.primary,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.tertiary),
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.tertiary),
            borderRadius: const BorderRadius.all(Radius.circular(6)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.tertiary),
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
        ),
      ),
    );
  }
}
