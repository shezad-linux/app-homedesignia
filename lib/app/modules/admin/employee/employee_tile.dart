import 'package:flutter/material.dart';
import 'package:interior/assets/text.dart';

Widget employeeTile(BuildContext context, String title, String description,
    double imgHeight, String bgImag, VoidCallback onPressed) {
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
            height: isDesktop
                ? MediaQuery.of(context).size.height * 0.25
                : isTablet
                    ? MediaQuery.of(context).size.height * 0.2
                    : MediaQuery.of(context).size.height * 0.1,
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
            child: Row(
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
                    children: [
                      Text(
                        "Name : $title",
                        style: BaseTextstyle.font16w400,
                      ),
                      Text(
                        "DOJ : $description",
                        style: BaseTextstyle.font14w400,
                      )
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  )
                ])),
      );
    }),
  );
}
