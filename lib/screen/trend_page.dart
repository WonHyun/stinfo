import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class BestItem {
  int rank;
  String imgPath;
  double expectReturn;
  String brand;
  String itemName;
  int piecePrice;
  double increaseRate;

  BestItem({
    required this.rank,
    required this.imgPath,
    required this.expectReturn,
    required this.brand,
    required this.itemName,
    required this.piecePrice,
    required this.increaseRate,
  });

  String getRankString() {
    return rank.toString();
  }

  String getExpectPercentString() {
    return "${(expectReturn * 100).toStringAsFixed(2)}%";
  }

  String getPieceAmountString() {
    return "${_formatCurrency(piecePrice)}원";
  }

  String getIncreaseRateString() {
    return increaseRate >= 0
        ? "+${(expectReturn * 100).toStringAsFixed(2)}%"
        : "-${(expectReturn * 100).toStringAsFixed(2)}%";
  }

  String _formatCurrency(int amount) {
    return NumberFormat('#,###', 'ko_KR').format(amount);
  }
}

class TrendPage extends StatelessWidget {
  final List<BestItem> itemList = [
    BestItem(
      rank: 1,
      imgPath: "cn_bag_01.png",
      expectReturn: 0.10,
      brand: "Chanel",
      itemName: "Chanel Gabrielle Hobo Bobby",
      piecePrice: 1140,
      increaseRate: 0.052,
    ),
    BestItem(
      rank: 2,
      imgPath: "cn_bag_02.png",
      expectReturn: 0.092,
      brand: "Chanel",
      itemName: "Chanel Goldenball Camel Special",
      piecePrice: 1050,
      increaseRate: 0.032,
    ),
    BestItem(
      rank: 3,
      imgPath: "cn_bag_03.png",
      expectReturn: 0.00,
      brand: "Chanel",
      itemName: "Chanel Gabrielle Hobo Bobby",
      piecePrice: 1254000,
      increaseRate: -0.012,
    ),
  ];

  TrendPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          const Text(
            "베스트 TOP 3",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "지금 주목받고 있는 상품을 알려드려요!",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 400,
            child: ListView(
              padding: const EdgeInsets.all(10.0),
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              children: [
                BestItemCard(
                  item: itemList[0],
                ),
                const SizedBox(
                  width: 20,
                ),
                BestItemCard(
                  item: itemList[1],
                ),
                const SizedBox(
                  width: 20,
                ),
                BestItemCard(
                  item: itemList[2],
                ),
              ],
            ),
          ),
          const Text(
            "AI 추천상품",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "매출의 15% 이상 월 배당 (10월 13일 기준)",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const AiRecommedItem(),
        ],
      ),
    );
  }
}

class AiRecommedItem extends StatelessWidget {
  const AiRecommedItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        Image.asset(
          'assets/images/ai_recom.png',
          fit: BoxFit.fitWidth,
        ),
        const Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "수원행궁 뉴스뮤지엄",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "청약기간",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "23.10.25 ~ 23.11.17",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "전체 공모 금액",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "2,890,000,000원 (28.9억원)",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () => {},
            ),
          ),
        ),
      ],
    );
  }
}

class BestItemCard extends StatelessWidget {
  final BestItem item;

  const BestItemCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 250,
          height: 330,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () => {},
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          width: 150,
                          height: 150,
                          child: Image(
                            fit: BoxFit.fill,
                            image: AssetImage(
                              'assets/images/${item.imgPath}',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "예상 수익률 ${item.getExpectPercentString()}",
                      style: const TextStyle(
                        color: Color(
                          0xFFFF7F23,
                        ),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      item.brand,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      item.itemName,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          item.getPieceAmountString(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(" "),
                        Text(
                          "(${item.getIncreaseRateString()})",
                          style: const TextStyle(
                            color: Color(0xFFFF7F23),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Transform.translate(
          offset: const Offset(10, -10),
          child: Stack(
            fit: StackFit.passthrough,
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/bookmark_icon.svg',
                fit: BoxFit.fitWidth,
              ),
              Text(
                item.getRankString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
