import 'package:flutter/material.dart';

import '../model/rank_list_data.dart';

class RankDataTable extends StatelessWidget {
  final List<String> label = ["순위", "상품명", "보유기간", "연환산수익"];
  final List<RankListData> listData = [
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

  RankDataTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataTable(
      horizontalMargin: 10,
      columnSpacing: 5,
      columns: List<DataColumn>.generate(
        label.length,
        (index) => DataColumn(
          label: Expanded(
            child: Center(
              child: Text(
                label[index],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
      rows: List<DataRow>.generate(
        listData.length,
        (index) => DataRow(cells: <DataCell>[
          DataCell(
            Center(
              child: Text(
                listData[index].rank,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          DataCell(
            SizedBox(
              width: 180,
              child: Text(
                listData[index].itemName,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ),
          DataCell(
            Container(
              alignment: Alignment.centerRight,
              child: Text(listData[index].duration),
            ),
          ),
          DataCell(
            Container(
              alignment: Alignment.centerRight,
              child: Text(
                listData[index].yearEarn,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
