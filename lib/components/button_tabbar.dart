import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import 'rank_data_table.dart';
// import 'rank_list.dart';

class ButtonTabBar extends StatefulWidget {
  const ButtonTabBar({Key? key}) : super(key: key);

  @override
  State<ButtonTabBar> createState() => _ButtonTabBarState();
}

class _ButtonTabBarState extends State<ButtonTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: <Widget>[
          ButtonsTabBar(
            elevation: 2,
            radius: 100,
            buttonMargin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
            contentPadding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            backgroundColor: const Color(0xFF638D74),
            unselectedBackgroundColor: Colors.grey[300],
            unselectedLabelStyle: const TextStyle(color: Colors.black),
            labelStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
            tabs: const [
              Tab(
                text: "연 수익률 순",
              ),
              Tab(
                text: "빠른 매각 순",
              ),
              Tab(
                text: "최근 1년 수익",
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: <Widget>[
                RankDataTable(),
                RankDataTable(),
                RankDataTable(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
