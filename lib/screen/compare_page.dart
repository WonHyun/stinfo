import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ItemInfo {
  String imgPath;
  String brand;
  String itemName;
  int gatherAmount;
  int sellAmount;
  String gatherDuration;
  double gatherPercent;

  ItemInfo({
    required this.imgPath,
    required this.brand,
    required this.itemName,
    required this.gatherAmount,
    required this.sellAmount,
    required this.gatherDuration,
    required this.gatherPercent,
  });

  String getPercentString() {
    return "${(gatherPercent * 100).toStringAsFixed(2)}%";
  }

  String getGatherAmountString() {
    return "${_formatCurrency(gatherAmount)}원";
  }

  String getSellAmountString() {
    return "${_formatCurrency(sellAmount)}원";
  }

  String _formatCurrency(int amount) {
    return NumberFormat('#,###', 'ko_KR').format(amount);
  }
}

class ComparePage extends StatelessWidget {
  final List<ItemInfo> itemInfo = [
    ItemInfo(
      imgPath: "rollex.png",
      brand: "롤렉스",
      itemName: "Daytona Oyster Flex Everose",
      gatherAmount: 72600000,
      sellAmount: 76000000,
      gatherDuration: "2023.07.20 ~ 2023.09.20",
      gatherPercent: 0.9103,
    ),
    ItemInfo(
      imgPath: "cn_bag_03.png",
      brand: "입생로랑",
      itemName: "루 카메라백 크로스백 (A944892)",
      gatherAmount: 980000,
      sellAmount: 1035000,
      gatherDuration: "2023.08.03 ~ 2023.08.13",
      gatherPercent: 0.8265,
    ),
  ];

  ComparePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        children: [
          const Text(
            "카테고리별 상품비교",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 300,
            child: GridView(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(0.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.0,
              ),
              children: [
                CategoryCard(
                  title: "부동산",
                  icon: Icons.business_outlined,
                  onTap: () => {},
                ),
                CategoryCard(
                  title: "미술품",
                  icon: Icons.photo_size_select_actual_outlined,
                  onTap: () => {},
                ),
                CategoryCard(
                  title: "음악저작권",
                  icon: Icons.headphones_outlined,
                  onTap: () => {},
                ),
                CategoryCard(
                  title: "명품/와인",
                  icon: Icons.card_giftcard_outlined,
                  onTap: () => {},
                ),
                CategoryCard(
                  title: "한우",
                  icon: Icons.abc,
                  onTap: () => {},
                ),
                CategoryCard(
                  title: "친환경",
                  icon: Icons.abc,
                  onTap: () => {},
                ),
              ],
            ),
          ),
          const Text(
            "조각투자 상품 소식",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GatherInfoCard(info: itemInfo[0]),
          const SizedBox(
            height: 20,
          ),
          GatherInfoCard(info: itemInfo[1]),
        ],
      ),
    );
  }
}

class GatherInfoCard extends StatelessWidget {
  final ItemInfo info;

  const GatherInfoCard({
    super.key,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => {},
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/images/${info.imgPath}'),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      info.brand,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      info.itemName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text("모집금액 ${info.getGatherAmountString()}"),
                    Text("매각금액 ${info.getSellAmountString()}"),
                    Text("모집기간 ${info.gatherDuration}"),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        info.getPercentString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    LinearPercentIndicator(
                      width: 260,
                      animation: true,
                      lineHeight: 10.0,
                      animationDuration: 2000,
                      percent: info.gatherPercent,
                      barRadius: const Radius.circular(8),
                      progressColor: Colors.greenAccent,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => {},
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              Positioned(
                right: 0,
                bottom: 0,
                child: Icon(
                  icon,
                  size: 80,
                  color: Colors.grey[300],
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const Positioned(
                top: 40,
                left: 10,
                child: Text(
                  "조각투자",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
