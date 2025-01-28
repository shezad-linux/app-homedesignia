import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interior/app/core/theme/app_theme.dart';
import 'package:interior/app/core/widgets/buttons.dart';
import 'package:interior/app/core/widgets/custom_text_fields.dart';
import 'package:interior/app/modules/admin/home/admin_home_view.dart';
import 'package:interior/assets/text.dart';
import 'package:interior/l10n/l10n.dart';

class AdminLoginView extends ConsumerWidget {
  static const routeName = '/adminLogin';

  AdminLoginView({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController();
  final RegExp filterPattern = RegExp(r'[a-zA-Z0-9@._\-]');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider).lightTheme;

    // Define filter pattern for email input

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.scaffoldBackgroundColor,
        body: LayoutBuilder(
          builder: (context, constraints) {
            // Determine device type based on width
            final isDesktop = constraints.maxWidth > 1200;
            final isTablet =
                constraints.maxWidth > 600 && constraints.maxWidth <= 1200;

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop
                      ? constraints.maxWidth * 0.1
                      : isTablet
                      ? 40
                      : 20,
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
                          child: Icon(
                            Icons.close,
                            color: appTheme.iconTheme.color,
                          ),
                        ),
                        SizedBox(
                          width: isDesktop
                              ? 30
                              : isTablet
                              ? 20
                              : 10,
                        ),
                        Text(
                          "Sign In As Admin",
                          style: BaseTextstyle.font18w600,
                        )
                      ],
                    ),
                    SizedBox(
                      height: isDesktop
                          ? 60
                          : isTablet
                          ? 40
                          : 20,
                    ),
                    CustomTextFormField(
                      keyboardType: TextInputType.emailAddress,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(filterPattern),
                      ],
                      controller: _controller,
                      hintText: 'Enter Email / Mobile Number',
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
                    SizedBox(
                      height: isDesktop
                          ? 60
                          : isTablet
                          ? 40
                          : 20,
                    ),
                    CustomButton(
                        label: 'Continue',
                        onPressed: () {
                          context.go(AdminHomeView.routeName);
                        }),
                    SizedBox(
                      height: isDesktop
                          ? 60
                          : isTablet
                          ? 40
                          : 20,
                    ),
                    Text(
                      AppLocalizations.of(context)?.signUpText ?? "",
                      style: BaseTextstyle.font14w400,
                    )
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