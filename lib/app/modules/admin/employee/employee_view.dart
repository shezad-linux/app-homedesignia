import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interior/app/core/theme/app_theme.dart';
import 'package:interior/app/core/widgets/add_button.dart';
import 'package:interior/app/core/widgets/buttons.dart';
import 'package:interior/app/core/widgets/custom_text_fields.dart';
import 'package:interior/app/core/widgets/custome_bottom_sheet.dart';
import 'package:interior/app/modules/admin/employee/employee_details_view.dart';
import 'package:interior/app/modules/admin/employee/employee_tile.dart';
import 'package:interior/app/modules/admin/employee/providers/employee_providers.dart';
import 'package:interior/assets/text.dart';
import 'package:interior/l10n/l10n.dart';

class EmployeeView extends ConsumerWidget {
  static const routeName = '/employeeView';
  EmployeeView({super.key});

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
                      Spacer(),
                      AddButton(
                        onPressed: () {
                          addEmployee(context);
                        },
                        radius: isDesktop
                            ? 40
                            : isTablet
                                ? 30
                                : 20,
                      )
                    ],
                  ),
                  Text(
                    AppLocalizations.of(context)?.employee ?? "",
                    style: BaseTextstyle.font18w600.copyWith(height: 2.0),
                  ),
                  Text(
                    AppLocalizations.of(context)?.manageEmployees ?? "",
                    style: BaseTextstyle.grey14w400.copyWith(height: 1.0),
                  ),
                  SizedBox(
                    height: isDesktop
                        ? 45
                        : isTablet
                            ? 30
                            : 20,
                  ),
                  for (int i = 0; i < 200; i++)
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
                                  ? MediaQuery.of(context).size.height * 0.10
                                  : MediaQuery.of(context).size.height * 0.060,
                          "https://imgs.search.brave.com/QZT_JW2J5h0fM0poNUUTnjniO4Tg8eXHa_rsCQNbos0/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZXJy/aWFtLXdlYnN0ZXIu/Y29tL2Fzc2V0cy9t/dy9pbWFnZXMvYXJ0/aWNsZS9hcnQtZ2xv/YmFsLWZvb3Rlci1y/ZWNpcmMvY293b3Jr/ZXJzJTIwbG9va2lu/ZyUyMGF0JTIwbGFw/dG9wLTgzNzQtNmU0/NTgwNGEwZTk1NTMy/ZjZlZjcxMTc1MDRh/ZTE4MWJAMXguanBn",
                          () {
                        context.push(EmployeeDeytailsView.routeName);
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
          TextEditingController employee = TextEditingController();

          return Consumer(builder: (context, ref, widget) {
            DateTime checkDoj = ref.watch(dateOfJoingingProvider);
            final selectedPackageImages = ref.watch(packageImages);
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
                    children: [
                      CustomTextFormField(
                          hintText: 'Enter your employee name*',
                          keyboardType: TextInputType.name,
                          controller: employee,
                          validator: (validator) {
                            final value = validator?.trim();
                            if (value!.isEmpty) {
                              return 'Please enter your employee name';
                            }
                            return null;
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () async {
                          checkDoj = await ref
                              .read(dateOfJoingingProvider.notifier)
                              .pickDate(context);
                        },
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: "Date of Joining : ",
                                      style: BaseTextstyle.font16w400),
                                  TextSpan(
                                      text:
                                          " ${checkDoj.day}/ ${checkDoj.month} / ${checkDoj.year}",
                                      style: BaseTextstyle.font14w400)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Employee photo"),
                      SizedBox(
                        height: 5,
                      ),
                      PhysicalModel(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        elevation: 6,
                        child: ref.read(packageImages)?.path != null
                            ? InkWell(
                                onTap: () {
                                  ref
                                      .read(packageImages.notifier)
                                      .pickImage(ImageSource.camera);
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  width:
                                      MediaQuery.of(context).size.height * 0.1,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: FileImage(File(
                                            selectedPackageImages?.path ?? '',
                                          ))),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(3)),
                                      color: Color(0xFFEAEAEA)),
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  ref
                                      .read(packageImages.notifier)
                                      .pickImage(ImageSource.camera);
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  width:
                                      MediaQuery.of(context).size.height * 0.1,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(3)),
                                      color: Color(0xFFEAEAEA)),
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                          label: 'Add employee',
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
