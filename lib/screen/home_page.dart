import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stinfo/components/button_tabbar.dart';
import 'package:stinfo/components/clickable_card.dart';
import 'package:stinfo/components/page_view_with_indicator.dart';

import '../components/category_grid.dart';
import '../components/category_header.dart';
import '../components/image_card.dart';

class MagazineThumb {
  String postId;
  String imgPath;
  String subject;

  MagazineThumb({
    required this.postId,
    required this.imgPath,
    required this.subject,
  });
}

class HomePage extends StatelessWidget {
  final List<MagazineThumb> magazineList = [
    MagazineThumb(
        postId: "1", imgPath: "magazine_01.png", subject: "한국 실험미술을 재조명하다"),
    MagazineThumb(
        postId: "2", imgPath: "magazine_02.png", subject: "한국 맥주 현대사"),
    MagazineThumb(
        postId: "3", imgPath: "magazine_03.png", subject: "전세사기와 포퓰리즘"),
    MagazineThumb(
        postId: "4", imgPath: "magazine_04.png", subject: "2024 봄 여름 여성 패션쇼"),
  ];

  HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TabController tabController = Provider.of<TabController>(context);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          Column(
            children: [
              const PageViewWithIndicator(),
              const SizedBox(
                height: 10,
              ),
              CategoryHeader(
                text: "추천 카테고리",
                onPressed: () => {
                  tabController.animateTo(3),
                },
              ),
              const CategoryGrid(),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(10.0),
                child: const Text(
                  "수익률 TOP 5",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(height: 400, child: ButtonTabBar()),
              CategoryHeader(
                text: "상품 비교",
                onPressed: () => {
                  tabController.animateTo(3),
                },
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                  child: ClickableCard(
                    widgets: const [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.currency_exchange_sharp,
                              color: Colors.amber,
                              size: 80,
                            ),
                          ),
                          Text(
                            "단돈 만원으로 투자할 수 있는\n상품을 한눈에 비교해 보세요",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                    onTap: () => {},
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              CategoryHeader(
                text: "특집 매거진",
                onPressed: () => {
                  tabController.animateTo(4),
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: magazineList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                    child: ImageCard(
                      img: magazineList[index].imgPath,
                      subject: magazineList[index].subject,
                      onTap: () => {},
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
