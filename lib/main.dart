import 'package:flutter/material.dart';
import 'screen/compare_page.dart';
import 'screen/home_page.dart';
import 'screen/info_detail_page.dart';

import 'package:provider/provider.dart';

import 'screen/magazine_page.dart';
import 'screen/trend_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '스틴포',
      theme: ThemeData(
        primaryColor: Colors.white,
        fontFamily: 'NanumSquare',
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController?.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableProvider<TabController>(
      create: (context) => _tabController!,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          leading: _tabController?.index == 0
              ? const Text("")
              : IconButton(
                  onPressed: () => {_tabController?.animateTo(0)},
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
          title: const Image(
            image: AssetImage('assets/images/stinfo_logo.png'),
            fit: BoxFit.fitHeight,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
              child: IconButton(
                  onPressed: () => {},
                  icon: const Icon(
                    Icons.notifications_none,
                    color: Colors.black,
                    size: 36,
                  )),
            )
          ],
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            const HomePage(),
            TrendPage(),
            const InfoDetailPage(),
            ComparePage(),
            const MagazinePage(),
          ],
        ),
        bottomNavigationBar: TabBar(
          controller: _tabController,
          unselectedLabelColor: Colors.grey[400],
          labelPadding: const EdgeInsets.all(2.0),
          labelStyle: const TextStyle(
            fontSize: 16,
            fontFamily: 'NanumSquare',
          ),
          tabs: const [
            Tab(
              icon: Icon(Icons.home),
              text: "홈",
            ),
            Tab(
              icon: Icon(Icons.auto_graph_sharp),
              text: "트랜드",
            ),
            Tab(
              icon: Icon(Icons.search),
              text: "상품검색",
            ),
            Tab(
              icon: Icon(Icons.compare),
              text: "상품비교",
            ),
            Tab(
              icon: Icon(Icons.article),
              text: "매거진",
            ),
          ],
        ),
      ),
    );
  }
}
