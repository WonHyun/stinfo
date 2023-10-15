import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewWithIndicator extends StatefulWidget {
  const PageViewWithIndicator({super.key});

  @override
  State<PageViewWithIndicator> createState() => _PageViewWithIndicatorState();
}

class _PageViewWithIndicatorState extends State<PageViewWithIndicator> {
  Timer? _timer;
  int _currentPage = 0;

  final controller =
      PageController(initialPage: 1, viewportFraction: 1, keepPage: false);

  final List<String> path = ["home_01.png", "home_02.png", "home_03.png"];

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TabController tabController = Provider.of<TabController>(context);

    final pages = List.generate(
      3,
      (index) => Material(
        color: Colors.transparent,
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 46.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/${path[index]}'),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              tabController.animateTo(2);
            },
          ),
        ),
      ),
    );

    return Column(
      children: [
        SizedBox(
          height: 480,
          child: PageView.builder(
            controller: controller,
            itemBuilder: (_, index) {
              return pages[index % pages.length];
            },
          ),
        ),
        Transform.translate(
          offset: const Offset(0, -30),
          child: SmoothPageIndicator(
            controller: controller,
            count: pages.length,
            effect: ColorTransitionEffect(
              dotHeight: 16,
              dotWidth: 16,
              dotColor: Colors.grey.shade300,
              activeDotColor: Colors.grey.shade700,
            ),
          ),
        ),
      ],
    );
  }
}
