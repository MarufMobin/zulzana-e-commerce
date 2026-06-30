import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:zulzana_e_commerce/app/app_colors.dart';
import '../provider/otp_timer_provider.dart';
import '../widgets/app_logo.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  static const String name = '/verify-otp';

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final PinInputController _otpTEController = PinInputController();
  final OtpTimerProvider _otpTimerProvider = OtpTimerProvider(60);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _otpTimerProvider.startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return ChangeNotifierProvider.value(
      value: _otpTimerProvider,
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
                    Text('Verify Your OTP', style: textTheme.titleLarge),
                    const SizedBox(height: 6),
                    Text(
                      'Enter your otp that has been sent to your email address',
                      style: textTheme.labelLarge,
                    ),
                    const SizedBox(height: 24),
                    MaterialPinField(
                      length: 4,
                      blinkDuration: Duration(microseconds: 300),
                      pinController: _otpTEController,
                      keyboardType: TextInputType.number,
                      theme: MaterialPinTheme(
                        fillColor: Colors.transparent,
                        focusedFillColor: Colors.transparent,
                        focusedBorderColor: AppColors.themeColor,
                      ),
                    ),
                    FilledButton(
                      onPressed: _onTapSignInButton,
                      child: Text('Verify'),
                    ),
                    const SizedBox(height: 16),
                    Consumer<OtpTimerProvider>(
                      builder: (context, _, _) {
                        if (_otpTimerProvider.secondsLeft == 0) {
                          return TextButton(
                            onPressed: _onTapResendOTP,
                            child: Text("Resend OTP"),
                          );
                        } else {
                          return RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Resend OTP after ',
                                  style: TextStyle(color: Colors.black),
                                ),
                                TextSpan(
                                  text: '${_otpTimerProvider.secondsLeft}S',
                                  style: TextStyle(color: AppColors.themeColor),
                                ),
                              ],
                            ),
                          );
                        }
                      },
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
    // if( _formKey.currentState!.validate()){
    //   //TODO: call sing in button
    // }
  }

  void _onTapResendOTP() {
    _otpTimerProvider.startTimer();
  }

  @override
  void dispose() {
    _otpTEController.dispose();
    super.dispose();
  }
}
