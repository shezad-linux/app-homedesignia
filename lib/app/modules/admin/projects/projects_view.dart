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
import 'package:interior/app/modules/admin/projects/project_details_view.dart';
import 'package:interior/app/modules/admin/projects/project_tile.dart';
import 'package:interior/app/modules/admin/projects/providers/project_providers.dart';
import 'package:interior/assets/text.dart';
import 'package:interior/l10n/l10n.dart';

class ProjectsView extends ConsumerWidget {
  static const routeName = '/projectView';
  ProjectsView({super.key});

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
                    AppLocalizations.of(context)?.projects ?? "",
                    style: BaseTextstyle.font18w600.copyWith(height: 2.0),
                  ),
                  Text(
                    AppLocalizations.of(context)?.manageProjects ?? "",
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
                            context.push(ProjectDetailsView.routeName);
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
            DateTime checkDoj = ref.watch(dateOfoprojStartProvider);
            final selectedPackageImages = ref.watch(packageProjectImages);
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
                          hintText: 'Enter your project name*',
                          keyboardType: TextInputType.name,
                          controller: employee,
                          validator: (validator) {
                            final value = validator?.trim();
                            if (value!.isEmpty) {
                              return 'Please enter your project name';
                            }
                            return null;
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () async {
                          checkDoj = await ref
                              .read(dateOfoprojStartProvider.notifier)
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
                                      text: "Date of starting : ",
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
                      Text("Project photo"),
                      SizedBox(
                        height: 5,
                      ),
                      PhysicalModel(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        elevation: 6,
                        child: ref.read(packageProjectImages)?.path != null
                            ? InkWell(
                                onTap: () {
                                  ref
                                      .read(packageProjectImages.notifier)
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
                                      .read(packageProjectImages.notifier)
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
                          label: 'Add Project',
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
