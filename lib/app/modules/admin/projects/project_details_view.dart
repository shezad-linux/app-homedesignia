// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:interior/app/core/theme/app_theme.dart';
import 'package:interior/app/modules/admin/employee/employee_tile.dart';
import 'package:interior/assets/text.dart';

class ProjectDetailsView extends ConsumerWidget {
  static const routeName = '/projectVDetailsiew';
  ProjectDetailsView({super.key});

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
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  height: isDesktop
                      ? MediaQuery.of(context).size.height * 0.45
                      : isTablet
                          ? MediaQuery.of(context).size.height * 0.4
                          : MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(
                      "https://imgs.search.brave.com/QHtnZKbeHGavnBqi2E2CIyJaU81J_L4v1JmyLhhMMr8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMuYWRzdHRjLmNv/bS9tZWRpYS9pbWFn/ZXMvNjE5NC9kN2Rh/L2Y5MWMvODEyMC9m/NTAwLzAwMzQvbmV3/c2xldHRlci9QQUxf/RGVzaWduX05VQk9f/SW1hZ2VfXygxKS5q/cGc_MTYzNzE0NDUy/Ng",
                    ),
                    fit: BoxFit.fill,
                  )),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.9),
                        maxRadius: isDesktop
                            ? 40
                            : isTablet
                                ? 30
                                : 20,
                        child: Icon(
                          Icons.close,
                          color: appTheme.iconTheme.color,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
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
                    children: [
                      Row(
                        children: [
                          Text(
                            "Project Name:",
                            style: BaseTextstyle.font16w400,
                          ),
                          Spacer(),
                          Expanded(
                            flex: 4,
                            child: Text(
                              "John Doe's Home project",
                              style: BaseTextstyle.font16w400,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Icon(
                            Icons.edit,
                            color: appTheme.iconTheme.color,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Project Deadline:",
                            style: BaseTextstyle.font16w400,
                          ),
                          Spacer(),
                          Expanded(
                            flex: 4,
                            child: Text(
                              "2/11/2025",
                              style: BaseTextstyle.font16w400,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Icon(
                            Icons.edit,
                            color: appTheme.iconTheme.color,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Project Started:",
                            style: BaseTextstyle.font16w400,
                          ),
                          Spacer(),
                          Expanded(
                            flex: 4,
                            child: Text(
                              "2/11/2024",
                              style: BaseTextstyle.font16w400,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Icon(
                            Icons.edit,
                            color: appTheme.iconTheme.color,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Current Status : Ongoing",
                            style: BaseTextstyle.font16w400,
                          ),
                          Spacer(),
                          Icon(
                            Icons.edit,
                            color: appTheme.iconTheme.color,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Team",
                        style: BaseTextstyle.font16w400,
                      ),
                      for (int i = 0; i < 3; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: employeeTile(
                              context,
                              'John Doe',
                              '20/11/2012',
                              "Project Manager",
                              "#${i + 1}",
                              isDesktop
                                  ? MediaQuery.of(context).size.height * 0.150
                                  : isTablet
                                      ? MediaQuery.of(context).size.height *
                                          0.10
                                      : MediaQuery.of(context).size.height *
                                          0.060,
                              "https://imgs.search.brave.com/QZT_JW2J5h0fM0poNUUTnjniO4Tg8eXHa_rsCQNbos0/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZXJy/aWFtLXdlYnN0ZXIu/Y29tL2Fzc2V0cy9t/dy9pbWFnZXMvYXJ0/aWNsZS9hcnQtZ2xv/YmFsLWZvb3Rlci1y/ZWNpcmMvY293b3Jr/ZXJzJTIwbG9va2lu/ZyUyMGF0JTIwbGFw/dG9wLTgzNzQtNmU0/NTgwNGEwZTk1NTMy/ZjZlZjcxMTc1MDRh/ZTE4MWJAMXguanBn",
                              () {}),
                        ), 

                      SizedBox(
                        height: 10,
                      ), 
                      Row(
                        children: [
                          Text("Payment Status", 
                          style: BaseTextstyle.font16w400,
                          ), 
                          Spacer(),
                          Text("Ontime", 
                          style: BaseTextstyle.font16w400,
                          ), 
                          SizedBox(width: 10,),
                          Icon(Icons.edit, color: appTheme.iconTheme.color,)
                      ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
