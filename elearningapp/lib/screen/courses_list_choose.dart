import 'package:elearningapp/components/course_choose.dart';
import 'package:elearningapp/components/courses.dart';
import 'package:flutter/material.dart';
import 'package:elearningapp/constants.dart';
import 'package:flutter_svg/svg.dart';

class CoursesListChoose extends StatefulWidget {
  CoursesListChoose({Key key}) : super(key: key);

  @override
  _CoursesListChooseState createState() => _CoursesListChooseState();
}

class _CoursesListChooseState extends State<CoursesListChoose> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        color: Color(0xffF18C8E),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding + 10,
                vertical: kDefaultPadding * 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () => {Navigator.pop(context)},
                      child: SvgPicture.asset('assets/images/back.svg')),
                  SvgPicture.asset('assets/images/navigation.svg'),
                ],
              ),
            ),
            Text(
              'Choose what\nto learn',
              style: TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Container(
              height: size.height * 0.7,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                ),
              ),
              child: Container(
                height: size.height * 0.7,
                width: size.width,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 6,
                      width: 78,
                      decoration: BoxDecoration(
                          color: Color(0xffEEEEEE),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    Container(
                      height: size.height * 0.65,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            CoursesChoose(
                              isAcive: true,
                              imageName: 'assets/images/adobeXD.svg',
                              title: 'Adobe XD\nPrototyping',
                              percentage: '25%',
                              backgroundColor: kLightPink,
                            ),
                            CoursesChoose(
                              isAcive: false,
                              imageName: 'assets/images/sketch_Icon.svg',
                              title: 'Sketch shortcuts\nand tricks',
                              percentage: '25%',
                              backgroundColor: kLightYellow,
                            ),
                            CoursesChoose(
                              isAcive: true,
                              imageName: 'assets/images/after_effects.svg',
                              title: 'UI Motion Design in\nAfter Effects',
                              percentage: '25%',
                              backgroundColor: kLightPurbel,
                            ),
                            CoursesChoose(
                              isAcive: false,
                              imageName: 'assets/images/figma_Icon.svg',
                              title: 'Figma Essentials',
                              percentage: '25%',
                              backgroundColor: Color(0xffFFF1EF),
                            ),
                            CoursesChoose(
                              isAcive: true,
                              imageName: 'assets/images/photoshop _Icon.svg',
                              title: 'Adobe Photoshop.\nRetouching',
                              percentage: '25%',
                              backgroundColor: Color(0xffEAF9FE),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
