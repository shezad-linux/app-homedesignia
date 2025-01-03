import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interior/app/core/theme/app_theme.dart';
import 'package:interior/app/core/widgets/buttons.dart';
import 'package:interior/app/modules/auth/admin_login_view.dart';
import 'package:interior/app/modules/auth/login_view.dart';
import 'package:interior/l10n/l10n.dart';

class OnboardingView extends ConsumerWidget {
  static const routeName = '/onboarding';

  OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider).lightTheme;

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.scaffoldBackgroundColor,
        body: LayoutBuilder(
          builder: (context, constraints) {
            // Determine device type based on width
            final isDesktop = constraints.maxWidth > 1200;
            final isTablet =
                constraints.maxWidth > 600 && constraints.maxWidth <= 1200;

            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop
                    ? constraints.maxWidth * 0.1
                    : isTablet
                        ? 40
                        : 20,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                      borderRadius: 8.0,
                      label: AppLocalizations.of(context)?.employeeLogin ?? "",
                      onPressed: () {
                        context.push(LoginView.routeName);
                      }),
                  SizedBox(
                    height: isDesktop
                        ? 60
                        : isTablet
                            ? 40
                            : 20,
                  ),
                  CustomButton(
                      borderColor: Colors.black26,
                      backgroundColor: Colors.white,
                      borderRadius: 8.0,
                      textColor: Colors.black,
                      label: AppLocalizations.of(context)?.loginAdmin ?? "",
                      onPressed: () {
                        context.push(AdminLoginView.routeName);
                      })
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
