import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:st_curier_bd/src/component/colors/colors.dart';
import 'package:st_curier_bd/src/screens/home_screen.dart';
import 'package:st_curier_bd/src/services/auth/registrationScreen.dart';
import 'package:st_curier_bd/src/widgets/custom_button.dart';
import 'package:st_curier_bd/src/widgets/text_widget.dart';
import 'package:st_curier_bd/src/widgets/textfill_widget.dart';
import 'package:st_curier_bd/src/widgets/vertical_spacing.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final _emailTextController = TextEditingController();
  final _passTextController = TextEditingController();
  final _passFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  var _obscureText = true;
  @override
  void dispose() {
    _emailTextController.dispose();
    _passTextController.dispose();
    _passFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: mediaQuery.height * 0.3,
                width: mediaQuery.height * 0.3,
                child: const Image(
                    image: CachedNetworkImageProvider(
                  'https://stcourier.stitbd.app/public/uploads/application/1692693950YRInjW3J1USkdT976599.jpg',
                )),
              ),
              TextWidget(
                text: 'OTP',
                textSize: 30,
              ),
              const VerticalSpacing(10),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        ///email
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_passFocusNode),
                          controller: _emailTextController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Please enter a valid email address';
                            } else {
                              return null;
                            }
                          },
                          style: const TextStyle(
                              color: primaryColor, fontSize: 20),
                          decoration: InputDecoration(
                            fillColor: primaryColor,
                            labelText: 'Enter OTP',
                            labelStyle:
                                TextStyle(color: primaryColor, fontSize: 17),
                            border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: primaryColor),
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Enter OTP',
                            hintStyle: const TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 115, 114, 114)),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    )),
              ),
              const VerticalSpacing(10),
              //otp
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: CustomButton(
                    fct: () {
                      setState(() {
                        if (_formKey.currentState!.validate()) {
                          //check if form data are valid,
                          Get.offAll(HomeScreen());
                          // your process task ahed if all data are valid
                        }
                      });
                    },
                    text: 'SUBMIT',
                    color: primaryColor),
              ),
              const VerticalSpacing(10),
            ],
          ),
        ),
      ),
    );
  }
}
