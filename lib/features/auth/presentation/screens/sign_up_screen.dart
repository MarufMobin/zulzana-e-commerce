import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zulzana_e_commerce/features/auth/data/models/sign_up_params.dart';

import '../../../shared/presentation/utils/validators.dart';
import '../../../shared/presentation/widgets/centered_progress_indicator.dart';
import '../../../shared/presentation/widgets/snack_bar_message.dart';
import '../provider/sign_up_provider.dart';
import '../widgets/app_logo.dart';
import 'verify_otp_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  /// *********************************
  /// Text Editing Controller
  /// *********************************

  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();

  /// *********************************
  /// Focus Nodes are here
  /// *********************************
  final _emailFocus = FocusNode();
  final _firstNameFocus = FocusNode();
  final _lastNameFocus = FocusNode();
  final _cityFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _phonedFocus = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final SignUpProvider _signUpProvider = SignUpProvider();

  bool _enableButton = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return ChangeNotifierProvider.value(
      value: _signUpProvider,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: _checkIfFormValid,
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    AppLogo(width: 80),
                    const SizedBox(height: 16),
                    Text('Create an Account', style: textTheme.titleLarge),
                    const SizedBox(height: 6),
                    Text(
                      'Sign up with your email and password',
                      style: textTheme.labelLarge,
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: _emailTEController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_emailFocus);
                      },
                      autofillHints: const [AutofillHints.email],
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        labelText: 'Email',
                      ),
                      validator: (String? value) =>
                          Validators.validEmail(value),
                    ),
                    const SizedBox(height: 8),

                    TextFormField(
                      controller: _firstNameTEController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_firstNameFocus);
                      },
                      autofillHints: const [AutofillHints.givenName],
                      decoration: const InputDecoration(
                        hintText: 'First Name',
                        labelText: 'First Name',
                      ),
                      validator: (String? value) =>
                          Validators.validateInput(value, 'Enter Your Name'),
                    ),
                    const SizedBox(height: 8),

                    TextFormField(
                      controller: _lastNameTEController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_lastNameFocus);
                      },
                      autofillHints: const [AutofillHints.familyName],
                      decoration: const InputDecoration(
                        hintText: 'Last Name',
                        labelText: 'Last Name',
                      ),
                      validator: (String? value) => Validators.validateInput(
                        value,
                        'Enter Your Last Name',
                      ),
                    ),
                    const SizedBox(height: 8),

                    TextFormField(
                      controller: _cityTEController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_cityFocus);
                      },
                      autofillHints: const [AutofillHints.addressCity],
                      decoration: const InputDecoration(
                        hintText: 'City',
                        labelText: 'City',
                      ),
                      validator: (String? value) =>
                          Validators.validateInput(value, 'Enter Your City'),
                    ),

                    const SizedBox(height: 8),

                    TextFormField(
                      controller: _phoneTEController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_phonedFocus);
                      },
                      autofillHints: const [AutofillHints.telephoneNumber],
                      decoration: const InputDecoration(
                        hintText: 'Phone',
                        labelText: 'Phone',
                      ),
                      validator: (String? value) =>
                          Validators.validateInput(value, 'Enter Your Phone'),
                    ),
                    const SizedBox(height: 8),

                    TextFormField(
                      controller: _passwordTEController,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_passwordFocus);
                      },
                      obscureText: true,
                      obscuringCharacter: '*',
                      autofillHints: const [AutofillHints.newPassword],
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        labelText: 'Password',
                      ),
                      validator: (String? value) =>
                          Validators.validatePassword(value),
                    ),
                    const SizedBox(height: 16),
                    Consumer<SignUpProvider>(
                      builder: (context, _, child) {
                        if (_signUpProvider.signUpInProgress) {
                          return CenteredProgressIndicator();
                        }

                        return FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: _enableButton == false
                                ? Colors.grey
                                : null,
                          ),
                          onPressed: _enableButton ? _onTapSignUpButton : null,
                          child: child,
                        );
                      },
                      child: Text('Sign Up'),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: _onTapSignInButton,
                      child: Text("Have an account? Sign In"),
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

  void _onTapSignInButton() {
    Navigator.pop(context);
  }

  void _checkIfFormValid() {
    if (_formKey.currentState!.validate()) {
      _enableButton = true;
    } else {
      _enableButton = false;
    }
    setState(() {});
  }

  void _onTapSignUpButton() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      _signUp();
    }
  }

  Future<void> _signUp() async {
    SignUpParams params = SignUpParams(
      email: _emailTEController.text.trim(),
      firstName: _firstNameTEController.text.trim(),
      lastName: _lastNameTEController.text.trim(),
      city: _cityTEController.text.trim(),
      phone: _phoneTEController.text.trim(),
      password: _passwordTEController.text,
    );

    final bool isSuccess = await _signUpProvider.signUp(params);

    if (!mounted) return;

    if (isSuccess) {
      Navigator.pushNamed(
        context,
        VerifyOtpScreen.name,
        arguments: _emailTEController.text.trim(),
      );
    } else {
      showSnackBarMessage(context, _signUpProvider.errorMessage!);
    }
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _cityTEController.dispose();
    _passwordTEController.dispose();
    _phoneTEController.dispose();
    super.dispose();
  }
}
