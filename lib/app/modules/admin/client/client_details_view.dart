// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:interior/app/core/theme/app_theme.dart';
import 'package:interior/app/core/widgets/custom_text_fields.dart';
import 'package:interior/app/modules/admin/client/providers/client_providers.dart';
import 'package:interior/assets/text.dart';

class ClientDetailsView extends ConsumerWidget{
  static const routeName = '/clientDetailsView';
  ClientDetailsView({super.key});


  TextEditingController nameController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController totalController = TextEditingController();
  TextEditingController remainController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateTime projDate = ref.watch(projectStartDate);
    final name = ref.watch(clinetNameProvider);
    final status = ref.watch(paymentStatusProvider);
    final address = ref.watch(addressProvider);
    final total = ref.watch(totalProvider);
    final remain = ref.watch(remaingProvider);
    final appTheme = ref.watch(appThemeProvider).lightTheme;
    return SafeArea(child: Scaffold(
       backgroundColor: appTheme.scaffoldBackgroundColor,
       body: LayoutBuilder(builder: (context,constraints){
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
                          Text("Name : ", 
                          style: BaseTextstyle.font16w400,
                          ), 
                          Spacer(), 
                        name? Expanded(
                          flex: 6,
                          child: CustomTextFormField(
                            hintText: "Enter client's name",
                            controller: nameController, validator: (validator){
                            return null;
                          })) :Text("John Doe", 
                          style:BaseTextstyle.font16w400,
                          ), 
                          InkWell(
                            onTap: 
                            (){
                              ref.read(clinetNameProvider.notifier).state = !ref.read(clinetNameProvider.notifier).state;
                            },
                            child: Icon(Icons.edit))
                        ],
                      ), 
                      SizedBox(
                        height: 10,
                      ), 

                      Row(
                        children: [
                          Text("Project Started Date :", 
                          style:BaseTextstyle.font16w400,
                          ), 
                          Spacer(),

                          Text("${projDate.day}/${projDate.month}/${projDate.year}", 
                          style:BaseTextstyle.font16w400,
                          ), 
                           InkWell(
                            onTap: ()async{
                               projDate = await ref
                                  .read(projectStartDate.notifier)
                                  .pickDate(context);
                            },
                            child: Icon(Icons.edit))
                        ],
                      ), 

                       SizedBox(
                        height: 10,
                      ), 

                      Row(
                        children: [
                          Text("Payment status", 
                          style:BaseTextstyle.font16w400,
                          ), 
                          Spacer(),

                        status? Expanded(
                          flex: 6,
                          child: CustomTextFormField(
                            hintText: 'Enter payment status',
                            controller: statusController, validator: (validator){
                          return null;
                        })) : Text("Cleared", 
                          style:BaseTextstyle.font16w400,
                          ) , 
                           InkWell(
                            onTap: (){
                              ref.read(paymentStatusProvider.notifier).state = !ref.read(paymentStatusProvider.notifier).state;
                            },
                            child: Icon(Icons.edit))
                        ],
                      ),

                       SizedBox(
                        height: 10,
                      ), 

                      Row(
                        children: [
                          Text("Address :", 
                          style:BaseTextstyle.font16w400,
                          ), 
                          Spacer(),

                       address ? Expanded(
                        flex: 6,
                        child: CustomTextFormField(
                          hintText: 'Enter address',
                          controller: addressController, validator: (validator){
                        return null;
                       }))  :Text("ABC,locality,State-1100001", 
                          style:BaseTextstyle.font16w400,
                          ), 
                           InkWell(
                            onTap: (){
                              ref.watch(addressProvider.notifier).state =!ref.read(addressProvider.notifier).state;
                            },
                            child: Icon(Icons.edit))
                        ],
                      ), 

                       SizedBox(
                        height: 10,
                      ), 

                      Row(
                        children: [
                          Text("Total Payment", 
                          style:BaseTextstyle.font16w400,
                          ), 
                          Spacer(),

                         total ?Expanded(
                        flex: 6,
                        child: CustomTextFormField(
                          hintText: 'Enter total payment',
                          controller: totalController, validator: (validator){
                        return null;
                       }))   :Text("INR 4000000", 
                          style:BaseTextstyle.font16w400,
                          ), 
                           InkWell(
                            onTap: (){
                              ref.watch(totalProvider.notifier).state = !ref.watch(totalProvider.notifier).state;
                            },
                            child: Icon(Icons.edit))
                        ],
                      ), 


                       SizedBox(
                        height: 10,
                      ), 

                      Row(
                        children: [
                          Text("Remaing Payment:", 
                          style:BaseTextstyle.font16w400,
                          ), 
                          Spacer(),

                         remain ?Expanded(
                        flex: 6,
                        child: CustomTextFormField(
                          hintText: 'Enter remaining payment',
                          controller: remainController, validator: (validator){
                        return null;
                       }))  :Text("INR 300000", 
                          style:BaseTextstyle.font16w400,
                          ), 
                           InkWell(
                            onTap: (){
                              ref.read(remaingProvider.notifier).state = !ref.read(remaingProvider.notifier).state;
                            },
                            child: Icon(Icons.edit))
                        ],
                      )
                       ],
                  ),
                ),
             
                  ],
                ),
              );
       }),
    ));
  }
}