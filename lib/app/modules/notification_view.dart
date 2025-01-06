import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:interior/app/core/theme/app_theme.dart';
import 'package:interior/app/core/widgets/notification_tile.dart';

class NotificationView extends ConsumerWidget{

  static const routeName = '/notificationView';
  NotificationView({super.key});

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
             title: Text("Notification"),
             centerTitle: true,
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

                  for(int i =0; i<9; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 
                      8.0),
                    child: NotificationWidget(
                      icon: Icons.check_circle_outline,
                      title: 'Project Started',
                      description: 'Your project named xyz has been started',
                      trailingTitle: "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                    ),
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