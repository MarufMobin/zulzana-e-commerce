import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zulzana_e_commerce/features/shared/presentation/widgets/snack_bar_message.dart';

import '../../../shared/presentation/screens/main_nav_bar_holder.dart';
import '../../../shared/presentation/utils/validators.dart';
import '../../../shared/presentation/widgets/centered_progress_indicator.dart';
import '../../data/models/sign_in_params.dart';
import '../provider/sing_in_provider.dart';
import '../widgets/app_logo.dart';
import 'sign_up_screen.dart';

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
  final SignInProvider _signInProvider = SignInProvider();

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return ChangeNotifierProvider.value(
      value: _signInProvider,
      child: Scaffold(
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
                      validator: (String? value) =>
                          Validators.validatePassword(value),
                    ),
                    const SizedBox(height: 16),
                    Consumer<SignInProvider>(
                      builder: (context, _, _){
                        if (_signInProvider.signInProgress) {
                          return CenteredProgressIndicator();
                        }
                        return FilledButton(
                          onPressed: _onTapSignInButton,
                          child: Text('Sign in'),
                        );
                      },
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
      ),
    );
  }

  void _onTapSignInButton() {
    if (_formKey.currentState!.validate()) {
      signIn();
    }
  }

  Future<void> signIn() async {
    SignInParams params = SignInParams(
      email: _emailTEController.text.trim(),
      password: _passwordTEController.text,
    );

    final isSuccess = await _signInProvider.signIn(params);

    if (!mounted) return;

    if (isSuccess) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        MainNavBarHolder.name,
        (predicate) => false,
      );
    } else {
      showSnackBarMessage(context, _signInProvider.errorMessage!);
    }
  }

  void _onTapSignUpButton() {
    Navigator.pushNamed(context, SignUpScreen.name);
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
