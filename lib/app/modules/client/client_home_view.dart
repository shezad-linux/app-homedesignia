import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:interior/app/core/theme/app_theme.dart';
import 'package:interior/app/modules/admin/projects/project_tile.dart';
import 'package:interior/app/modules/client/client_project_detail.dart';
import 'package:interior/app/modules/notification_view.dart';

class ClientHomeView extends ConsumerWidget {
  static const routeName = "/clientHome";
  ClientHomeView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider).lightTheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.scaffoldBackgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70), // Height of the AppBar
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            child: AppBar(
              elevation: 4,
              backgroundColor: appTheme.primaryColor,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://imgs.search.brave.com/QHtnZKbeHGavnBqi2E2CIyJaU81J_L4v1JmyLhhMMr8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMuYWRzdHRjLmNv/bS9tZWRpYS9pbWFn/ZXMvNjE5NC9kN2Rh/L2Y5MWMvODEyMC9m/NTAwLzAwMzQvbmV3/c2xldHRlci9QQUxf/RGVzaWduX05VQk9f/SW1hZ2VfXygxKS5q/cGc_MTYzNzE0NDUy/Ng"),
                          fit: BoxFit.fill)),
                ),
              ),
              actions: [
                Spacer(),
                InkWell(
                  onTap: (){
                    context.push(NotificationView.routeName);
                  },
                  child: Icon(Icons.notification_important_sharp,
                      color: Color(0xCCFFFFFF)),
                )
              ],
            ),
          ),
        ),
        body: LayoutBuilder(builder: (builder, constraints) {
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
                  for(int i =0; i<7;i++)
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: projectTile(
                          context,
                          'John Doe Project',
                          '20/11/2012',
                          'Ongoing',
                          "#${i+1}",
                          isDesktop
                              ? MediaQuery.of(context).size.height * 0.150
                              : isTablet
                                  ? MediaQuery.of(context).size.height * 0.10
                                  : MediaQuery.of(context).size.height * 0.060,
                          "https://imgs.search.brave.com/QHtnZKbeHGavnBqi2E2CIyJaU81J_L4v1JmyLhhMMr8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMuYWRzdHRjLmNv/bS9tZWRpYS9pbWFn/ZXMvNjE5NC9kN2Rh/L2Y5MWMvODEyMC9m/NTAwLzAwMzQvbmV3/c2xldHRlci9QQUxf/RGVzaWduX05VQk9f/SW1hZ2VfXygxKS5q/cGc_MTYzNzE0NDUy/Ng",
                          () {
                            context.push(ClientProjectDetail.routeName);
                          }),
                    )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
