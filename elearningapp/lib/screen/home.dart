import 'package:elearningapp/components/courses.dart';
import 'package:elearningapp/constants.dart';
import 'package:elearningapp/screen/courses_list.dart';
import 'package:elearningapp/screen/courses_list_choose.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Container(
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: size.height * 0.5,
                    decoration: BoxDecoration(
                      color: kBold2Pink,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(45),
                        bottomRight: Radius.circular(45),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding,
                        vertical: kDefaultPadding,
                      ),
                      child: SvgPicture.asset('assets/images/navigation.svg'),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: SvgPicture.asset(
                      'assets/images/boy_llustration.svg',
                      height: size.height * 0.4,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcom back\nMikołaj!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(kDefaultPadding)),
                            height: 55,
                            width: size.width * 0.8,
                            margin: EdgeInsets.symmetric(
                                horizontal: kDefaultPadding),
                            padding: EdgeInsets.symmetric(
                                horizontal: kDefaultPadding),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    autocorrect: false,
                                    decoration: InputDecoration(
                                      hintText: "Search for new knowledge!",
                                      hintStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.search,
                                  size: 20,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: kDefaultPadding * 1.5,
                          ),
                          Container(
                            height: 150,
                            width: size.width * 0.8,
                            margin: EdgeInsets.symmetric(
                                horizontal: kDefaultPadding),
                            padding: EdgeInsets.only(
                              top: kDefaultPadding / 2,
                              left: kDefaultPadding,
                            ),
                            decoration: BoxDecoration(
                              color: kLightPink2,
                              borderRadius:
                                  BorderRadius.circular(kDefaultPadding),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Spacer(),
                                Text(
                                  'Start learning\nnew Staff!',
                                  style: TextStyle(
                                    color: kBoldBlue,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () => {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CoursesListChoose()),
                                        )
                                      },
                                      child: Container(
                                        width: size.width * 0.4,
                                        padding: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                            color: kBold2Pink,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Categories",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Spacer(),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: Colors.white,
                                              size: 15,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    SvgPicture.asset(
                                      'assets/images/undraw_researchi.svg',
                                      width: size.width * 0.3,
                                    ),
                                  ],
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Row(
                  children: [
                    Text(
                      'Courses in progress',
                      style: TextStyle(
                          color: kBoldBlue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer()
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CoursesList()),
                        )
                      },
                      child: Courses(
                        imageName: 'assets/images/adobeXD.svg',
                        title: 'Adobe XD\nPrototyping',
                        percentage: '25%',
                        backgroundColor: kLightPink,
                      ),
                    ),
                    Courses(
                      imageName: 'assets/images/sketch_Icon.svg',
                      title: 'Sketch shortcuts\nand tricks',
                      percentage: '25%',
                      backgroundColor: kLightYellow,
                    ),
                    Courses(
                      imageName: 'assets/images/after_effects.svg',
                      title: 'UI Motion Design in\nAfter Effects',
                      percentage: '25%',
                      backgroundColor: kLightPurbel,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
