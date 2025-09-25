import 'package:ayur_clinic_portal/core/constants.dart';
import 'package:ayur_clinic_portal/widgets/custom_button.dart';
import 'package:ayur_clinic_portal/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_image.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              AppColors.blurOverlay,
              BlendMode.darken,
            ), //  overlay effect
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo (Green leaf icon - )
                const SizedBox(
                  height: 80.0,
                  child: Center(
                    child: Image(
                      //   logo
                      image: AssetImage('assets/logo.png'),
                      height: 60.0,
                      width: 60.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 32.0),
                // Title
                const Text(
                  'Login Or Register To Book Your Appointments',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textBlack,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 48.0),
                // Email Field
                const CustomTextFormField(
                  label: 'Email',
                  hintText: 'Enter your email',
                  obscureText: false,
                ),
                const SizedBox(height: 24.0),
                // Password Field
                const CustomTextFormField(
                  label: 'Password',
                  hintText: 'Enter password',
                  obscureText: true,
                ),
                const SizedBox(height: 32.0),
                // Login Button
                CustomButton(
                  text: 'Login',
                  onPressed: () {
                    //  login logic
                  },
                ),
                const SizedBox(height: 32.0),

                // Terms and Conditions Text with Links
                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                    children: [
                      const TextSpan(
                        text:
                            'By creating or logging into an account you are agreeing ',
                      ),
                      const TextSpan(text: 'with our '),
                      TextSpan(
                        text: 'Terms and Conditions',
                        style: const TextStyle(color: AppColors.linkBlue),
                      ),
                      const TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Privacy Policy.',
                        style: const TextStyle(color: AppColors.linkBlue),
                      ),
                    ],
                  ),
                ),

                // RichText(
                //   textAlign: TextAlign.center,
                //   text: TextSpan(
                //     style: const TextStyle(
                //       fontSize: 12.0,
                //       color: AppColors.textBlack,
                //       height: 1.5,
                //     ),
                //     children: [

                //       const TextSpan(
                //         text:
                //             'By creating or logging into an account you are agreeing ',
                //       ),
                //       const TextSpan(text: 'with our '),
                //       TextSpan(
                //         text: 'Terms and Conditions',
                //         style: const TextStyle(
                //           color: AppColors.linkBlue,
                //           decoration: TextDecoration.underline,
                //         ),
                //         recognizer: TapGestureRecognizer()
                //           ..onTap = () {
                //             //  terms
                //           },
                //       ),
                //       const TextSpan(text: ' and '),
                //       TextSpan(
                //         text: 'Privacy Policy.',
                //         style: const TextStyle(
                //           color: AppColors.linkBlue,
                //           decoration: TextDecoration.underline,
                //         ),
                //         recognizer: TapGestureRecognizer()
                //           ..onTap = () {
                //             // privacy policy
                //           },
                //       ),
                //     ],
                //   ),
                // ),
                // const SizedBox(height: 24.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
