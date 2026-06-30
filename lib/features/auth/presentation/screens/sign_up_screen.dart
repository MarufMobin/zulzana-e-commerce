import 'package:flutter/material.dart';
import 'package:zulzana_e_commerce/features/shared/presentation/utils/validators.dart';
import '../widgets/app_logo.dart';

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

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: () {},
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
                    validator: (String? value) => Validators.validEmail(value),
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
                    validator: (String? value) =>
                        Validators.validateInput(value, 'Enter Your Last Name'),
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
                  FilledButton(
                    onPressed: _onTapSignUpButton,
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
    );
  }

  void _onTapSignUpButton() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {}
  }

  void _onTapSignInButton() {
    Navigator.pop(context);
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
