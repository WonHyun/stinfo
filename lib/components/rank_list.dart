import 'package:flutter/material.dart';

import '../model/rank_list_data.dart';

class RankList extends StatefulWidget {
  const RankList({
    super.key,
  });

  @override
  State<RankList> createState() => _RankListState();
}

class _RankListState extends State<RankList> {
  List<String> label = ["순위", "상품명", "보유기간", "연환산수익"];
  List<RankListData> listData = [
    RankListData(
      rank: "1",
      itemName: "수프림 네오빈티지 버킷 리스트는 정말 많다",
      duration: "19일",
      yearEarn: "+213%",
    ),
    RankListData(
      rank: "2",
      itemName: "루이비통 모노그램 키폴리스트 엑스트라 버진",
      duration: "24일",
      yearEarn: "+170%",
    ),
    RankListData(
      rank: "3",
      itemName: "라지 클래식 참 클러치백 스페셜 에디션 엑션가면",
      duration: "108일",
      yearEarn: "+156%",
    ),
    RankListData(
      rank: "4",
      itemName: "CC 로고 플랩 스몰 AS230 레이어 아웃 파이어 에그",
      duration: "516일",
      yearEarn: "+150%",
    ),
    RankListData(
      rank: "5",
      itemName: "클래식 캐비어 코스메틱 유로파 에디션",
      duration: "15일",
      yearEarn: "+128%",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "순위",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 5,
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "상품명",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "보유기간",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "연환산수익",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listData.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Text(
                            listData[index].rank,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: Text(
                            listData[index].itemName,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: false,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Text(
                            listData[index].duration,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Text(
                            listData[index].yearEarn,
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
