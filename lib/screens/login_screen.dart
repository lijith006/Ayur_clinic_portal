import 'package:ayur_clinic_portal/core/constants.dart';
import 'package:ayur_clinic_portal/core/utils/validators.dart';
import 'package:ayur_clinic_portal/providers/auth_provider.dart';
import 'package:ayur_clinic_portal/screens/home_screen.dart';
import 'package:ayur_clinic_portal/widgets/custom_button.dart';
import 'package:ayur_clinic_portal/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Top section with background + logo
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/images/bg_2.png",
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                    color: Colors.black.withOpacity(0.3),
                    colorBlendMode: BlendMode.darken,
                  ),
                  const Image(
                    image: AssetImage('assets/images/logo_small.png'),
                    height: 80.0,
                    width: 80.0,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 32.0),
                    // Title
                    Text(
                      'Login Or Register To Book\n Your Appointments',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.headlineLarge!
                          .copyWith(
                            color: AppColors.textBlack,
                            letterSpacing: 0.5,
                          ),
                    ),
                    const SizedBox(height: 48.0),
                    // Email Field
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            controller: _usernameController,
                            label: 'Email',
                            hintText: 'Enter your email',
                            obscureText: false,
                            validator: Validator.validateUsername,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    // Password Field
                    CustomTextFormField(
                      controller: _passwordController,
                      label: 'Password',
                      hintText: 'Enter password',
                      obscureText: true,
                      validator: Validator.validatePassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(height: 32.0),
                    // Login Button
                    CustomButton(
                      text: authProvider.loading ? 'Loading...' : 'Login',
                      onPressed: authProvider.loading
                          ? null
                          : () async {
                              if (_formKey.currentState!.validate()) {
                                final success = await authProvider.login(
                                  _usernameController.text.trim(),
                                  _passwordController.text.trim(),
                                );
                                if (success) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const HomeScreen(),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Login failed.'),
                                    ),
                                  );
                                }
                              }
                            },
                    ),

                    const SizedBox(height: 50.0),

                    // Terms and Conditions Text with Links
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
