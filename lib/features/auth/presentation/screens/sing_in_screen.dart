import 'package:flutter/material.dart';
import 'package:zulzana_e_commerce/features/shared/presentation/utils/validators.dart';
import '../widgets/app_logo.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sing-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: () {},
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  AppLogo(width: 100),
                  const SizedBox(height: 16),
                  Text('Welcome Back', style: textTheme.titleLarge),
                  const SizedBox(height: 6),
                  Text(
                    'Sing in with your email and password',
                    style: textTheme.labelLarge,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _emailTEController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email',
                      // hintText: AppLocalizations.of(context)!.email,
                      // hintText: context.localization.email,
                    ),
                    validator: (String? value) => Validators.validEmail(value),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordTEController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                    ),
                    validator: (String? value) => Validators.validatePassword(value),
                  ),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: _onTapSignInButton,
                    child: Text('Sign in'),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: _onTapSignUpButton,
                    child: Text("Don'\t have an account? Sign up"),
                  ),
                  // TextButton(onPressed: (){}, child: Text("Forgot Password?")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignInButton() {
    if( _formKey.currentState!.validate()){
      //TODO: call sing in button
    }
  }

  void _onTapSignUpButton() {}

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
