// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:interior/app/core/theme/app_theme.dart';
import 'package:interior/app/core/widgets/add_button.dart';
import 'package:interior/app/core/widgets/buttons.dart';
import 'package:interior/app/core/widgets/custom_text_fields.dart';
import 'package:interior/app/core/widgets/custome_bottom_sheet.dart';
import 'package:interior/app/modules/admin/projects/providers/project_providers.dart';
import 'package:interior/app/modules/admin/projects/teams_tile.dart';
import 'package:interior/assets/text.dart';

class ProjectDetailsView extends ConsumerWidget {
  static const routeName = '/projectVDetailsiew';
  ProjectDetailsView({super.key});

  TextEditingController nameController = TextEditingController();

  TextEditingController paymentController = TextEditingController();

  TextEditingController statusontroller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateTime checkDos = ref.watch(dateOfoprojStartProvider);
    DateTime checkDoe = ref.watch(endDateProvider);
    final name = ref.watch(nameProvider);
    final paymentStatus = ref.watch(projDeadLineProvider);

    final status = ref.watch(currentStatusprovider);
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
                          name
                              ? Expanded(
                                  flex: 6,
                                  child: CustomTextFormField(
                                      hintText: 'Enter project name',
                                      controller: nameController,
                                      validator: (validator) {
                                        final value = validator!.trim();
                                        if (value.isEmpty) {
                                          return 'Please enter project name';
                                        }
                                        return null;
                                      }),
                                )
                              : Expanded(
                                  flex: 4,
                                  child: Text(
                                    "John Doe's Home project",
                                    style: BaseTextstyle.font16w400,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                          InkWell(
                            onTap: () {
                              name
                                  ? ref.read(nameProvider.notifier).state =
                                      false
                                  : ref.read(nameProvider.notifier).state =
                                      true;
                            },
                            child: Icon(
                              Icons.edit,
                              color: appTheme.iconTheme.color,
                            ),
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
                              "${checkDoe.day}/${checkDoe.month}/${checkDoe.year}",
                              style: BaseTextstyle.font16w400,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              checkDoe = await ref
                                  .read(endDateProvider.notifier)
                                  .pickDate(context);
                            },
                            child: Icon(
                              Icons.edit,
                              color: appTheme.iconTheme.color,
                            ),
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
                              "${checkDos.day}/${checkDos.month}/${checkDos.year}",
                              style: BaseTextstyle.font16w400,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              checkDos = await ref
                                  .read(dateOfoprojStartProvider.notifier)
                                  .pickDate(context);
                            },
                            child: Icon(
                              Icons.edit,
                              color: appTheme.iconTheme.color,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Current Status :",
                            style: BaseTextstyle.font16w400,
                          ),
                          Spacer(),
                          status
                              ? Expanded(
                                  flex: 6,
                                  child: CustomTextFormField(
                                      controller: statusontroller,
                                      hintText: 'Update Status',
                                      validator: (validator) {
                                        final value = validator!.trim();
                                        if (value.isEmpty) {
                                          return 'please enter status for your project';
                                        }
                                        return null;
                                      }))
                              : Text(
                                  "Ongoing",
                                  style: BaseTextstyle.font16w400,
                                ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              status
                                  ? ref
                                      .read(currentStatusprovider.notifier)
                                      .state = false
                                  : ref
                                      .read(currentStatusprovider.notifier)
                                      .state = true;
                            },
                            child: Icon(
                              Icons.edit,
                              color: appTheme.iconTheme.color,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Team",
                            style: BaseTextstyle.font16w400,
                          ),
                          Spacer(),
                          AddButton(
                            onPressed: () {
                              addEmployee(context);
                            },
                            radius: isDesktop
                                ? 30
                                : isTablet
                                    ? 20
                                    : 15,
                          )
                        ],
                      ),
                      for (int i = 0; i < 3; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: teamsTile(
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
                              () {},
                              "INR 40000",
                              () {}),
                        ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Payment Status",
                            style: BaseTextstyle.font16w400,
                          ),
                          Spacer(),
                          paymentStatus
                              ? Expanded(
                                  flex: 9,
                                  child: CustomTextFormField(
                                      hintText: 'Update Payment status',
                                      controller: paymentController,
                                      validator: (validator) {
                                        final value = validator!.trim();
                                        if (value.isEmpty) {
                                          return 'Please update your payment status';
                                        }
                                        return null;
                                      }))
                              : Text(
                                  "Ontime",
                                  style: BaseTextstyle.font16w400,
                                ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              paymentStatus
                                  ? ref
                                      .read(projDeadLineProvider.notifier)
                                      .state = false
                                  : ref
                                      .read(projDeadLineProvider.notifier)
                                      .state = true;
                            },
                            child: Icon(
                              Icons.edit,
                              color: appTheme.iconTheme.color,
                            ),
                          )
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

  void addEmployee(
    BuildContext context,
  ) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20), // Top radius of the bottom sheet
          ),
        ),
        builder: (BuildContext context) {
          return Consumer(builder: (context, ref, widget) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight:
                    MediaQuery.of(context).size.height * 0.5, // 89% height
              ),
              child: CustomBottomSheet(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select your team",
                        style: BaseTextstyle.font18w600,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        // height: MediaQuery.of(context).size.height * 0.06,
                        width: double.infinity,
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                for (int i = 0; i < 10; i++)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        PhysicalModel(
                                          color: Colors.blueGrey,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(3)),
                                          elevation: 6,
                                          child: InkWell(
                                            onTap: () {},
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.06,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.06,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(3)),
                                                  color: Color(0xFFEAEAEA)),
                                              child: Center(
                                                child: Icon(
                                                  Icons.add,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("Employee"),
                                        Text("Designation")
                                      ],
                                    ),
                                  ),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      CustomButton(
                          label: 'Add to Team',
                          onPressed: () {
                            context.pop();
                          })
                    ],
                  ),
                ),
              )),
            );
          });
        });
  }
}
