import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:interior/app/core/theme/app_theme.dart';
import 'package:interior/app/modules/admin/client/client_view.dart';
import 'package:interior/app/modules/admin/employee/employee_view.dart';
import 'package:interior/app/modules/admin/home/admin_home_tile.dart';
import 'package:interior/app/modules/admin/projects/projects_view.dart';
import 'package:interior/assets/text.dart';
import 'package:interior/l10n/l10n.dart';

class AdminHomeView extends ConsumerWidget {
  static const routeName = '/adminHome';
  const AdminHomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider).lightTheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.scaffoldBackgroundColor,
        body: LayoutBuilder(builder: (context, constraints) {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)?.welcomeBack ?? "",
                    style: BaseTextstyle.font18w600.copyWith(height: 2.0),
                  ),
                  Text(
                    AppLocalizations.of(context)?.checkUpdates ?? "",
                    style: BaseTextstyle.grey14w400.copyWith(height: 1.0),
                  ),
                  SizedBox(
                    height: isDesktop
                        ? 45
                        : isTablet
                            ? 30
                            : 20,
                  ),
                  homeAdminTile(context, "Projects", "Check all your projects",
                      "https://imgs.search.brave.com/GnGte2aiwmgqVnWKvq8MneyXfCLtf2EasTAd9ouAGwE/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvODMy/NjYwNzcvcGhvdG8v/aW50ZXJpb3ItZGVz/aWduZXItdGFsa2lu/Zy13aXRoLWNvdXBs/ZS1pbi1zaG93cm9v/bS5qcGc_cz02MTJ4/NjEyJnc9MCZrPTIw/JmM9REFfRG1YWk9E/UkVMNWJ1OFpMQkFC/SHAwdzE1Yk1Kendk/V2JYY0JSR0ItQT0",
                      () {
                    context.push(ProjectsView.routeName);
                  }),
                  SizedBox(
                    height: isDesktop
                        ? 45
                        : isTablet
                            ? 30
                            : 20,
                  ),
                  homeAdminTile(
                      context,
                      "Clients",
                      "Check all your clients",
                      "https://imgs.search.brave.com/GnGte2aiwmgqVnWKvq8MneyXfCLtf2EasTAd9ouAGwE/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvODMy/NjYwNzcvcGhvdG8v/aW50ZXJpb3ItZGVz/aWduZXItdGFsa2lu/Zy13aXRoLWNvdXBs/ZS1pbi1zaG93cm9v/bS5qcGc_cz02MTJ4/NjEyJnc9MCZrPTIw/JmM9REFfRG1YWk9E/UkVMNWJ1OFpMQkFC/SHAwdzE1Yk1Kendk/V2JYY0JSR0ItQT0",
                      () {
                        context.push(ClientView.routeName);
                      }),
                  SizedBox(
                    height: isDesktop
                        ? 45
                        : isTablet
                            ? 30
                            : 20,
                  ),
                  homeAdminTile(
                      context,
                      "Employees",
                      "Manage all your employees",
                      "https://imgs.search.brave.com/GnGte2aiwmgqVnWKvq8MneyXfCLtf2EasTAd9ouAGwE/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvODMy/NjYwNzcvcGhvdG8v/aW50ZXJpb3ItZGVz/aWduZXItdGFsa2lu/Zy13aXRoLWNvdXBs/ZS1pbi1zaG93cm9v/bS5qcGc_cz02MTJ4/NjEyJnc9MCZrPTIw/JmM9REFfRG1YWk9E/UkVMNWJ1OFpMQkFC/SHAwdzE1Yk1Kendk/V2JYY0JSR0ItQT0",
                      () {
                    context.push(EmployeeView.routeName);
                  })
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
