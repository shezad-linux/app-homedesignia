// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:interior/app/core/theme/app_theme.dart';
import 'package:interior/app/core/widgets/custom_text_fields.dart';
import 'package:interior/app/modules/admin/employee/project_tile.dart';
import 'package:interior/app/modules/admin/employee/providers/employee_providers.dart';
import 'package:interior/assets/text.dart';

class EmployeeDeytailsView extends ConsumerWidget {
  static const routeName = '/employeeDetailsView';
  EmployeeDeytailsView({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController salaryStatusController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    final design = ref.watch(designationProvider);
    final salary = ref.watch(salaryprovider);
    DateTime doj = ref.watch(dateOfJoingingProvider);
    final salaryStatus = ref.watch(salaryStatusprovider);
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
                      "https://imgs.search.brave.com/QZT_JW2J5h0fM0poNUUTnjniO4Tg8eXHa_rsCQNbos0/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZXJy/aWFtLXdlYnN0ZXIu/Y29tL2Fzc2V0cy9t/dy9pbWFnZXMvYXJ0/aWNsZS9hcnQtZ2xv/YmFsLWZvb3Rlci1y/ZWNpcmMvY293b3Jr/ZXJzJTIwbG9va2lu/ZyUyMGF0JTIwbGFw/dG9wLTgzNzQtNmU0/NTgwNGEwZTk1NTMy/ZjZlZjcxMTc1MDRh/ZTE4MWJAMXguanBn",
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
                            "Name:",
                            style: BaseTextstyle.font16w400,
                          ),
                          Spacer(),
                          name
                              ? Expanded(
                                  flex: 6,
                                  child: CustomTextFormField(
                                      hintText: 'Enter employee name',
                                      controller: nameController,
                                      validator: (validator) {
                                        final value = validator!.trim();
                                        if (value.isEmpty) {
                                          return 'Please enter employee name';
                                        }
                                        return null;
                                      }))
                              : Text(
                                  "John Doe",
                                  style: BaseTextstyle.font16w400,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              ref.read(nameProvider.notifier).state =
                                  !ref.read(nameProvider.notifier).state;
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
                            "Date of Joining",
                            style: BaseTextstyle.font16w400,
                          ),
                          Spacer(),
                          Text(
                            "${doj.day}/${doj.month}/${doj.year}",
                            style: BaseTextstyle.font16w400,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () async {
                              doj = await ref
                                  .read(dateOfJoingingProvider.notifier)
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
                            "Designation",
                            style: BaseTextstyle.font16w400,
                          ),
                          Spacer(),
                          design
                              ? Expanded(
                                flex: 7,
                                  child: CustomTextFormField(
                                    hintText: 'Enter Designation',
                                      controller: designationController,
                                      validator: (validator) {
                                        final value = validator!.trim();
                                        if (value.isEmpty) {
                                          return 'PLease enter designation';
                                        }
                                        return null;
                                      }))
                              : Text(
                                  "Project Manager",
                                  style: BaseTextstyle.font16w400,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              ref.read(designationProvider.notifier).state =
                                  !ref.read(designationProvider.notifier).state;
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
                            "Salary : ",
                            style: BaseTextstyle.font16w400,
                          ),
                          Spacer(),
                        salary ?Expanded(
                          flex: 4,
                          child: CustomTextFormField(
                          inputFormatters: [
                          
                          ],
                          keyboardType: TextInputType.number,
                          hintText: 'Enter salary',
                          controller: salaryController, validator: (validator){
                          final value = validator!.trim();
                          if (value.isEmpty) {
                            return 'Please enter salary';
                          }
                          return null;
                        }))  :Text(
                            "INR 4000000",
                            style: BaseTextstyle.font16w400,
                          ),
                          Spacer(),
                          InkWell(
                            onTap: (){
                              ref.read(salaryprovider.notifier).state = !ref.read(salaryStatusprovider.notifier).state;
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
                      Text(
                        "Current Projects",
                        style: BaseTextstyle.font16w400,
                      ),
                      for (int i = 0; i < 3; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: currentProjectTile(
                              context,
                              'John Doe Project',
                              '20/11/2012',
                              'Ongoing',
                              "#${i + 1}",
                              isDesktop
                                  ? MediaQuery.of(context).size.height * 0.150
                                  : isTablet
                                      ? MediaQuery.of(context).size.height *
                                          0.10
                                      : MediaQuery.of(context).size.height *
                                          0.060,
                              "https://imgs.search.brave.com/QHtnZKbeHGavnBqi2E2CIyJaU81J_L4v1JmyLhhMMr8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMuYWRzdHRjLmNv/bS9tZWRpYS9pbWFn/ZXMvNjE5NC9kN2Rh/L2Y5MWMvODEyMC9m/NTAwLzAwMzQvbmV3/c2xldHRlci9QQUxf/RGVzaWduX05VQk9f/SW1hZ2VfXygxKS5q/cGc_MTYzNzE0NDUy/Ng",
                              () {},
                              () {}),
                        ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Salary Status",
                            style: BaseTextstyle.font16w400,
                          ),
                          Spacer(),
                        salaryStatus ?Expanded(
                                flex: 7,
                                  child: CustomTextFormField(
                                    hintText: 'Enter Salary status',
                                      controller: salaryStatusController,
                                      validator: (validator) {
                                        final value = validator!.trim();
                                        if (value.isEmpty) {
                                          return 'PLease enter salary status';
                                        }
                                        return null;
                                      }))  :Text(
                            "Payed",
                            style: BaseTextstyle.font16w400,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: (){
                              ref.read(salaryStatusprovider.notifier).state = !ref.read(salaryStatusprovider.notifier).state;
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
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
