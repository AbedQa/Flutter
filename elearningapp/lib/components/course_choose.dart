import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class CoursesChoose extends StatelessWidget {
  final String imageName, title, percentage;
  final Color backgroundColor;
  final bool isAcive;
  const CoursesChoose(
      {Key key,
      this.imageName,
      this.title,
      this.percentage,
      this.backgroundColor,
      this.isAcive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.15,
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      margin: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(kDefaultPadding)),
      child: Row(
        children: [
          Expanded(
            flex: 20,
            child: SvgPicture.asset(
              imageName,
              width: 50,
              height: 50,
            ),
          ),
          Expanded(
              flex: 60,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: kDefaultPadding + 10, left: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: kBoldBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '10 hours, 19 lessons',
                      style: TextStyle(
                        color: kBold3Pink,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
              flex: 25,
              child: Row(
                children: [
                  isAcive
                      ? SvgPicture.asset('assets/images/active.svg')
                      : SvgPicture.asset('assets/images/Inactive.svg')
                ],
              )),
        ],
      ),
    );
  }
}
