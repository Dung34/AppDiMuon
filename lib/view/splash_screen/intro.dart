import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../config/routes.dart';
import '../../data/resources/colors.dart';
import '../../data/resources/resources.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final controller = PageController();
    return Scaffold(
      backgroundColor: AppColor.primaryBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(left: 240, top: 10),
                child: TextButton(
                  onPressed: (() {
                    Navigator.pushNamed(context, AppRoute.login);
                  }),
                  child: const Text("Bỏ qua"),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 100,
              child: PageView(
                controller: controller,
                children: const [Page1(), Page2(), Page3(), Page4()],
              ),
            ),
            SmoothPageIndicator(
              controller: controller,
              count: 4,
              effect: JumpingDotEffect(
                  activeDotColor: Colors.lightBlue,
                  dotColor: Colors.lightBlue.shade50,
                  dotHeight: 10,
                  dotWidth: 10,
                  spacing: 4,
                  jumpScale: 1),
            )
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primaryBackgroundColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 300,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                      top: 100,
                      right: 55,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                Colors.purple.shade100,
                                Colors.blue.shade200
                              ])),
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 140,
                      right: 80,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.white, Colors.blue])),
                          height: 250,
                          width: 250,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 400,
                      left: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [Colors.white, Colors.blue])),
                          height: 50,
                          width: 50,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Checkin sự kiện",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: Colors.black),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 5),
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ));
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primaryBackgroundColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 300,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                      top: 100,
                      right: 55,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                Colors.purple.shade100,
                                Colors.blue.shade200
                              ])),
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 140,
                      right: 80,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.white, Colors.blue])),
                          height: 250,
                          width: 250,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 400,
                      left: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [Colors.white, Colors.blue])),
                          height: 50,
                          width: 50,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Checkin sự kiện",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: Colors.black),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 5),
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ));
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primaryBackgroundColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 300,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                      top: 100,
                      right: 55,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                Colors.purple.shade100,
                                Colors.blue.shade200
                              ])),
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 140,
                      right: 80,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.white, Colors.blue])),
                          height: 250,
                          width: 250,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 400,
                      left: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [Colors.white, Colors.blue])),
                          height: 50,
                          width: 50,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Checkin sự kiện",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: Colors.black),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 5),
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ));
  }
}

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primaryBackgroundColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 300,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                      top: 100,
                      right: 55,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                Colors.purple.shade100,
                                Colors.blue.shade200
                              ])),
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 140,
                      right: 80,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.white, Colors.blue])),
                          height: 250,
                          width: 250,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 400,
                      left: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [Colors.white, Colors.blue])),
                          height: 50,
                          width: 50,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Checkin sự kiện",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: Colors.black),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 5),
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 300),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoute.login);
                    },
                    icon: SvgPicture.asset(Assets.icArrowRight),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
