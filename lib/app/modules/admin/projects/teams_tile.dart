import 'package:flutter/material.dart';
import 'package:interior/assets/text.dart';

Widget teamsTile(BuildContext context, String title, String description,
String projectId, 
    String status, double imgHeight, String bgImag, VoidCallback onPressed, String salary,  VoidCallback removeClick,) {
  return InkWell(
    onTap: onPressed,
    child: LayoutBuilder(builder: (context, constraints) {
      final isDesktop = constraints.maxWidth > 1200;
      final isTablet =
          constraints.maxWidth > 600 && constraints.maxWidth <= 1200;
      return PhysicalModel(
        borderRadius: BorderRadius.all(
          Radius.circular(isDesktop
              ? 20
              : isTablet
                  ? 10
                  : 5),
        ),
        color: Colors.blueGrey,
        elevation: 7,
        child: Container(
            
            width: double.infinity,
            padding: EdgeInsets.all(isDesktop
                ? 20
                : isTablet
                    ? 16.0
                    : 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(isDesktop
                    ? 20
                    : isTablet
                        ? 10
                        : 5),
              ),
            ),
            child: Column(
              children: [
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: imgHeight,
                        width: imgHeight,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(bgImag), fit: BoxFit.fill)),
                      ),
                      SizedBox(
                        width: isDesktop
                            ? 30
                            : isTablet
                                ? 20
                                : 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name : $title",
                            style: BaseTextstyle.font16w400,
                          ),
                          Text(
                            "Start Date : $description",
                            style: BaseTextstyle.font14w400,
                          ),
                          Text(
                            "Current Status : $status",
                            style: BaseTextstyle.font14w400,
                          ),
                
                           Text(
                            "Project ID : $projectId",
                            style: BaseTextstyle.font14w400,
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.black,
                      )
                    ]),

                    SizedBox(
                      height: isDesktop ? 30: isTablet ? 20 : 15,
                    ), 
                    Row(
                      children: [
                        Text("Salary: ", 
                        style: BaseTextstyle.font16w400,
                        ), 
                        Spacer(), 

                        Text(salary, 
                        style: BaseTextstyle.font14w400,
                        ), 
                        SizedBox(
                          width: 10,
                        ), 
                        InkWell(
                          onTap: removeClick,
                          child: Icon(Icons.remove_circle_rounded, 
                          color: Theme.of(context).primaryColor,
                          ),
                        )
                      ],
                    )
              ],
            )),
      );
    }),
  );
}
