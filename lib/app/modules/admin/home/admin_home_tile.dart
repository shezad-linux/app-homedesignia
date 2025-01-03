import 'package:flutter/material.dart';
import 'package:interior/assets/text.dart';

Widget homeAdminTile(BuildContext context, String title, String description,
    String bgImag, VoidCallback onPressed) {
  return InkWell(
    onTap: onPressed,
    child: LayoutBuilder(builder: (context, constraints) {
      final isDesktop = constraints.maxWidth > 1200;
      final isTablet =
          constraints.maxWidth > 600 && constraints.maxWidth <= 1200;
      return Container(
        height: isDesktop
            ? MediaQuery.of(context).size.height * 0.3
            : isTablet
                ? MediaQuery.of(context).size.height * 0.25
                : MediaQuery.of(context).size.height * 0.2,
        width: double.infinity,
        padding: EdgeInsets.all(isDesktop
            ? 20
            : isTablet
                ? 16.0
                : 10.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(bgImag),
            fit: BoxFit.fill,
          ),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: BaseTextstyle.font24w600.copyWith(),
                ),
                Text(
                  description,
                  style: BaseTextstyle.font16w400.copyWith(),
                ),
              ],
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: 30,
            )
          ],
        ),
      );
    }),
  );
}
