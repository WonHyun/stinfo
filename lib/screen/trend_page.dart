import 'package:flutter/material.dart';

class TrendPage extends StatelessWidget {
  const TrendPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Text("베스트 TOP 3"),
        Text("지금 주목받고 있는 상품을 알려드려요!"),
        Text("AI 추천상품"),
        Text("매출의 15% 이상 월 배당 (10월 13일 기준)"),
      ],
    );
  }
}
