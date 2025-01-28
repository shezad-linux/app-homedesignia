import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:interior/app/core/theme/app_theme.dart';
import 'package:interior/app/core/widgets/buttons.dart';
import 'package:interior/app/core/widgets/custom_text_fields.dart';
import 'package:interior/app/modules/client/client_home_view.dart';
import 'package:interior/assets/text.dart';
import 'package:interior/l10n/l10n.dart';
import 'package:go_router/go_router.dart';
import 'package:interior/app/modules/client/clientDetailsView.dart';
//import 'package:interior/app/modules/client/UniqueUserDashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:interior/app/modules/auth/setPassword.dart';  // Import SetPassword screen

class LoginView extends ConsumerWidget {
  static const routeName = '/login';

  LoginView({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isSignUp = false; // Flag for Sign-In vs. Sign-Up mode

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return; // If the user cancels the login

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential;
      // Sign-in or sign-up based on the `isSignUp` flag
      userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      // Fetch user details from Firestore
      final userRef = FirebaseFirestore.instance.collection('clients').doc(userCredential.user!.uid);
      final userData = await userRef.get();

      if (userData.exists) {
        var role = userData['role'];  // Assuming 'role' field exists
        var dealFinalized = userData['dealFinalized'];  // Assuming 'dealFinalized' field exists

        if (role == 'employee') {
          context.go('/employeeDashboard');  // Navigate to Employee Dashboard
        } else if (role == 'client') {
          if (dealFinalized) {
            context.go('/finalizedClientDashboard');  // Navigate to Finalized Client Dashboard
          } else {
            context.go('/uniqueClientDashboard');  // Navigate to Unique Client Dashboard
          }
        }
      } else {
        // If user doesn't exist in Firestore, route to ClientDetailsView
        context.go(ClientDetailsView.routeName);
      }
    } catch (e) {
      print("Google Sign-In Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Google sign-in failed: $e')));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider).lightTheme;

    // Define filter pattern for email input
    final RegExp filterPattern = RegExp(r'[a-zA-Z0-9@._\-]');

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
                          isSignUp ? "Sign Up" : "Sign In",
                          style: BaseTextstyle.font18w600,
                        ),
                      ],
                    ),
                    SizedBox(height: isDesktop ? 60 : isTablet ? 40 : 20),
                    CustomTextFormField(
                      keyboardType: TextInputType.emailAddress,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(filterPattern),
                      ],
                      controller: _controller,
                      hintText: 'Enter Email',
                      validator: (validator) {
                        final value = validator?.trim();
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!value.contains('@') || !value.contains('.')) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
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
                    CustomButton(
                      label: isSignUp ? 'Sign Up' : 'Sign In',
                      onPressed: () async {
                        final email = _controller.text.trim();
                        final password = _passwordController.text.trim();

                        if (email.isEmpty || password.isEmpty || !email.contains('@') || !email.contains('.')) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter valid credentials')));
                          return;
                        }

                        try {
                          UserCredential userCredential;
                          if (isSignUp) {
                            userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

                            // After signup, route to SetPassword screen for employee role
                            final userRef = FirebaseFirestore.instance.collection('clients').doc(userCredential.user!.uid);
                            final userData = await userRef.get();
                            var role = userData['role'];

                            if (role == 'employee') {
                              context.go(SetPassword.routeName);  // Navigate to SetPassword screen for employee
                            } else {
                              // If the user is a client, navigate directly to client dashboard
                              context.go('/uniqueClientDashboard');
                            }
                          } else {
                            userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

                            // Fetch user details from Firestore
                            final userRef = FirebaseFirestore.instance.collection('clients').doc(userCredential.user!.uid);
                            final userData = await userRef.get();

                            if (userData.exists) {
                              var role = userData['role'];
                              var dealFinalized = userData['dealFinalized'];

                              if (role == 'employee') {
                                context.go('/employeeDashboard');  // Navigate to Employee Dashboard
                              } else if (role == 'client') {
                                if (dealFinalized) {
                                  context.go('/finalizedClientDashboard');  // Navigate to Finalized Client Dashboard
                                } else {
                                  context.go('/uniqueClientDashboard');  // Navigate to Unique Client Dashboard
                                }
                              }
                            } else {
                              // If user doesn't exist in Firestore, route to ClientDetailsView
                              context.go(ClientDetailsView.routeName);
                            }
                          }
                        } catch (e) {
                          print("Error: $e");
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed: $e')));
                        }
                      },
                    ),
                    SizedBox(height: isDesktop ? 60 : isTablet ? 40 : 20),
                    CustomButton(
                      label: isSignUp ? 'Sign up with Google' : 'Sign in with Google',
                      onPressed: () => _signInWithGoogle(context),
                    ),
                    SizedBox(height: isDesktop ? 60 : isTablet ? 40 : 20),
                    Text(
                      isSignUp ? "Already have an account? Sign In" : "Don't have an account? Sign Up",
                      style: BaseTextstyle.font14w400,
                    ),
                    // Toggle between Sign-In and Sign-Up
                    TextButton(
                      onPressed: () {
                        // Toggle between Sign-In and Sign-Up
                        isSignUp = !isSignUp;
                        // Trigger rebuild when the mode is toggled
                        (context as Element).markNeedsBuild();
                      },
                      child: Text(
                        isSignUp ? "Sign In" : "Sign Up",
                        style: TextStyle(color: appTheme.primaryColor),
                      ),
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
