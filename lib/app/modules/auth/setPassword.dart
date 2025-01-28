import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interior/app/core/theme/app_theme.dart';
import 'package:interior/app/core/widgets/buttons.dart';
import 'package:interior/app/core/widgets/custom_text_fields.dart';
import 'package:go_router/go_router.dart';
import 'package:interior/assets/text.dart';



class SetPassword extends ConsumerStatefulWidget {
  static const routeName = '/setPassword';

  const SetPassword({Key? key}) : super(key: key);

  @override
  _SetPasswordState createState() => _SetPasswordState();
}

class _SetPasswordState extends ConsumerState<SetPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  Future<void> _setPassword(BuildContext context) async {
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter a valid password')));
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Passwords do not match')));
      return;
    }

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Update password in Firebase Authentication
        await user.updatePassword(password);

        // Optionally, show a success message
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password set successfully')));

        // Navigate to Employee Dashboard or other relevant page
        context.go('/employeeDashboard');
      } else {
        // Handle error if user is not authenticated
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User not authenticated')));
      }
    } catch (e) {
      print("Error setting password: $e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error setting password')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = ref.watch(appThemeProvider).lightTheme;

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.scaffoldBackgroundColor,
        body: LayoutBuilder(
          builder: (context, constraints) {
            final isDesktop = constraints.maxWidth > 1200;
            final isTablet = constraints.maxWidth > 600 && constraints.maxWidth <= 1200;

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? constraints.maxWidth * 0.1 : isTablet ? 40 : 20,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            context.pop();
                          },
                          child: Icon(Icons.close, color: appTheme.iconTheme.color),
                        ),
                        SizedBox(width: isDesktop ? 30 : isTablet ? 20 : 10),
                        Text(
                          'Set Your Password',
                          style: BaseTextstyle.font18w600,
                        ),
                      ],
                    ),
                    SizedBox(height: isDesktop ? 60 : isTablet ? 40 : 20),
                    CustomTextFormField(
                      controller: _passwordController,
                      hintText: 'Enter Password',
                      obscureText: true,
                      validator: (validator) {
                        final value = validator?.trim();
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: isDesktop ? 60 : isTablet ? 40 : 20),
                    CustomTextFormField(
                      controller: _confirmPasswordController,
                      hintText: 'Confirm Password',
                      obscureText: true,
                      validator: (validator) {
                        final value = validator?.trim();
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: isDesktop ? 60 : isTablet ? 40 : 20),
                    CustomButton(
                      label: 'Set Password',
                      onPressed: () => _setPassword(context),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
