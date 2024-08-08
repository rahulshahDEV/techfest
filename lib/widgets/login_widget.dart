import 'package:byrahul/Extension/extension.dart';
import 'package:byrahul/constant.dart';
import 'package:byrahul/provider/login_provider.dart';
import 'package:byrahul/services/auth/auth_service.dart';
import 'package:byrahul/utils/helper_methods/custom_button.dart';
import 'package:byrahul/utils/helper_methods/custom_textfield.dart';
import 'package:byrahul/utils/themes/palette.dart';
import 'package:byrahul/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();

    final GlobalKey<FormState> formkey = GlobalKey<FormState>();
    final bool isLoading = context.watch<LoginProvider>().isLoading;
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customText(
                      text: 'LOGIN', colour: Palette.primary, fontSize: 30),
                  const SizedBox(
                    height: 50,
                  ),
                  // CustomTextfield(prefixIcon: prefixIcon, label: label, controller: controller)
                  CustomTextfield(
                      validator: (value) {
                        if (!value!.validateEmail() && value.isNotEmpty) {
                          return 'Please enter a valid email';
                        } else if (value.isEmpty) {
                          return 'This field shouldn\'t be empty';
                        } else {
                          return null;
                        }
                      },
                      prefixIcon: Icons.person,
                      label: 'Email',
                      controller: email),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextfield(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field shouldn\'t be empty';
                        } else {
                          return null;
                        }
                      },
                      prefixIcon: Icons.lock,
                      label: 'Password',
                      suffixIconExist: true,
                      postfixIcon: Icons.remove_red_eye,
                      controller: password),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                              foregroundColor:
                                  WidgetStateProperty.all<Color>(Colors.white),
                              backgroundColor: WidgetStateProperty.all<Color>(
                                  Palette.primary),
                              shape: WidgetStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)))),
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              if (!Provider.of<LoginProvider>(context,
                                      listen: false)
                                  .isLoading) {
                                Provider.of<LoginProvider>(context,
                                        listen: false)
                                    .login(
                                        context: context,
                                        email: email.text,
                                        password: password.text);
                              }
                            }
                          },
                          child: isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : customText(text: 'Login'),
                        ),
                      )
                    ],
                  ),
                  // CustomButton(
                  //     colour: Palette.primary,
                  //     icon: Icons.key,
                  //     label: 'Login',
                  //     height: 50,
                  //     width: MediaQuery.of(context).size.width,
                  //     onPressed: () {
                  //       Provider.of<LoginProvider>(context, listen: false).login(
                  //           context: context,
                  //           email: email.text,
                  //           password: password.text);
                  //     })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Widget loginWidget(BuildContext context) {
//   final TextEditingController email = TextEditingController();
//   final TextEditingController password = TextEditingController();
//   final bool isLoading = context.watch<LoginProvider>().isLoading;
//   final GlobalKey<FormState> formkey = GlobalKey<FormState>();
//   return Scaffold(
//     body: Padding(
//       padding:
//           EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//       child: Container(
//         height: double.infinity,
//         decoration: const BoxDecoration(),
//         child: Scaffold(
//           backgroundColor: Colors.white,
//           body: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Form(
//               key: formkey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   customText(
//                       text: 'LOGIN', colour: Palette.primary, fontSize: 30),
//                   const SizedBox(
//                     height: 50,
//                   ),
//                   // CustomTextfield(prefixIcon: prefixIcon, label: label, controller: controller)
//                   CustomTextfield(
//                       validator: (value) {
//                         if (!value!.validateEmail() && value.isNotEmpty) {
//                           return 'Please enter a valid email';
//                         } else if (value.isEmpty) {
//                           return 'This field shouldn\'t be empty';
//                         } else {
//                           return null;
//                         }
//                       },
//                       prefixIcon: Icons.person,
//                       label: 'Email',
//                       controller: email),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   CustomTextfield(
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'This field shouldn\'t be empty';
//                         } else {
//                           return null;
//                         }
//                       },
//                       prefixIcon: Icons.lock,
//                       label: 'Password',
//                       suffixIconExist: true,
//                       postfixIcon: Icons.remove_red_eye,
//                       controller: password),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: ElevatedButton(
//                           style: ButtonStyle(
//                               foregroundColor:
//                                   WidgetStateProperty.all<Color>(Colors.white),
//                               backgroundColor: WidgetStateProperty.all<Color>(
//                                   Palette.primary),
//                               shape: WidgetStateProperty.all<
//                                       RoundedRectangleBorder>(
//                                   RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(5)))),
//                           onPressed: () {
//                             if (formkey.currentState!.validate()) {
//                               if (!Provider.of<LoginProvider>(context,
//                                       listen: false)
//                                   .isLoading) {
//                                 Provider.of<LoginProvider>(context,
//                                         listen: false)
//                                     .login(
//                                         context: context,
//                                         email: email.text,
//                                         password: password.text);
//                               }
//                             }
//                           },
//                           child: isLoading
//                               ? const CircularProgressIndicator(
//                                   color: Colors.white,
//                                 )
//                               : customText(text: 'Login'),
//                         ),
//                       )
//                     ],
//                   ),
//                   // CustomButton(
//                   //     colour: Palette.primary,
//                   //     icon: Icons.key,
//                   //     label: 'Login',
//                   //     height: 50,
//                   //     width: MediaQuery.of(context).size.width,
//                   //     onPressed: () {
//                   //       Provider.of<LoginProvider>(context, listen: false).login(
//                   //           context: context,
//                   //           email: email.text,
//                   //           password: password.text);
//                   //     })
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }
