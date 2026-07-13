import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../../../shared/presentation/widgets/centered_progress_indicator.dart';
import '../../../shared/presentation/widgets/snack_bar_message.dart';
import '../../data/models/verify_otp_params.dart';
import '../provider/otp_timer_provider.dart';
import '../provider/verify_otp_provider.dart';
import '../widgets/app_logo.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key, required this.email});

  static const String name = '/verify-otp';
  final String email;

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final PinInputController _otpTEController = PinInputController();
  final OtpTimerProvider _otpTimerProvider = OtpTimerProvider(60);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final VerifyOtpProvider _verifyOtpProvider = VerifyOtpProvider();

  @override
  void initState() {
    super.initState();
    _otpTimerProvider.startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _otpTimerProvider),
        ChangeNotifierProvider.value(value: _verifyOtpProvider),
      ],
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
                    Consumer<VerifyOtpProvider>(
                      builder: (context, _, _) {
                        if (_verifyOtpProvider.verifyOtpInProgress) {
                          return CenteredProgressIndicator();
                        }
                        return FilledButton(
                          onPressed: _onTapVerifyOtpButton,
                          child: Text('Verify'),
                        );
                      },
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

  void _onTapVerifyOtpButton() {
    if (_formKey.currentState!.validate()) {
      _verifyOtp();
    }
  }

  Future<void> _verifyOtp() async {
    final bool isSuccess = await _verifyOtpProvider.verifyOtp(
      VerifyOtpParams(otp: _otpTEController.text, email: ''),
    );

    if (!mounted) return;
    if (isSuccess) {

    } else {
      showSnackBarMessage(context, _verifyOtpProvider.errorMessage!);
    }
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
