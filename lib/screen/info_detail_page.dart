import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:url_launcher/url_launcher.dart';

class InfoDetailPage extends StatefulWidget {
  const InfoDetailPage({
    super.key,
  });

  @override
  State<InfoDetailPage> createState() => _InfoDetailPageState();
}

class _InfoDetailPageState extends State<InfoDetailPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final ScrollController _scrollController = ScrollController();

  final controller =
      PageController(initialPage: 0, viewportFraction: 1.0, keepPage: true);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    // _tabController!.addListener(
    //   () {
    //     if (_tabController!.index == 1) {
    //       // When second tab is selected
    //       _scrollController.animateTo(
    //         150.0, // Example scroll position
    //         duration: const Duration(milliseconds: 300),
    //         curve: Curves.easeInOut,
    //       );
    //     }
    //   },
    // );
  }

  @override
  void dispose() {
    _tabController!.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              const Text(
                "카테고리 > 명품/와인 > 와인 > Red Wine",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "도멘 드 라 로마네꽁띠",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 24,
                  height: 1.2,
                ),
              ),
              const Text(
                "생 비방 그랑 크뤼, 마레 몽주 2010 3병",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  height: 1.2,
                ),
              ),
              const Text(
                "DRC 2010 Romanee-Saint-Vivant Grand Cru, Marey-Monge 3btls",
                style: TextStyle(
                  fontSize: 12,
                  height: 1.2,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "1,000원",
                        style: TextStyle(
                          color: Color(0xFF3EC8A7),
                          fontWeight: FontWeight.w900,
                          fontSize: 26,
                        ),
                      ),
                      Text(
                        "/1조각",
                        style: TextStyle(
                          color: Color(0xFF3EC8A7),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "-178원 (-18.20%)",
                    style: TextStyle(
                      color: Color(0xFF2B478A),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(5.0),
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Image(
                  image: AssetImage('assets/images/wine_three.png'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TabBar(
                controller: _tabController,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                indicatorColor: const Color(0xFF3EC8A7),
                indicatorWeight: 3,
                indicatorPadding: const EdgeInsets.all(5.0),
                labelPadding: const EdgeInsets.all(0.0),
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  Tab(text: '투자포인트'),
                  Tab(text: '상세정보'),
                  Tab(text: '수익률'),
                  Tab(text: '모집현황'),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "투자포인트",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const InfoCard(
                infoText: [
                  "공모 참여 소유주만의 멤버십 혜택",
                  "최고급 부르고뉴 와인들의 가치 상승",
                  "연 수익률 TOP 10"
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "가치 분석",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const InfoCard(infoText: [
                "1년 후 예상 수익률",
                "수익화 예상 기간",
                "구매 상품 위험도",
              ]),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "생 비방 그랑 크뤼 마레 몽주 2010 3병",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 300,
                child: PageView(
                  controller: controller,
                  children: const [
                    Image(
                      image: AssetImage('assets/images/wine_one.png'),
                    ),
                    Image(
                      image: AssetImage('assets/images/wine_three.png'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 2,
                    effect: const ColorTransitionEffect(
                      dotHeight: 12,
                      dotWidth: 12,
                      dotColor: Colors.grey,
                      activeDotColor: Color(0xFF3ec8a7),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "기본정보",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InfoTable(),
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "[Story] 생 비방 그랑 크뤼 마레 몽주 2010",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                    ),
                  ),
                  const Text("\n"),
                  const Text(
                    "부르고뉴를 대표하는 최고의 이름, 도멘 드 라 로마네꽁띠",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Text("\n"),
                  Text(
                    "도멘 드 라 로마네 콩티(Domaine de la Romanée-Conti). 간단히 줄여서 DRC라고 말하기도 한다. 와인 세계에서 꿈의 와인이라고도 불리는 최고가 와인인 로마네 콩티를 생산하는 양조장이 바로 DRC다. 프랑스 부르고뉴(Bourgogne) 지방 와인의 등급 체계 대한 이해가 조금 필요한데, 특급밭(그랑 크뤼) 1급밭 (프르미에 크뤼) 마을단위급 (빌라쥬 혹은 코뮈날레) 지방단위급 (레지오날레) 순으로 생산 지역이나 밭에 따른 등급이 정해져있으며, 특급밭은 33개가 지정되어있다.[1] 로마네 콩티는 본 로마네 마을에 위치한 특급밭의 하나로. 세계에서 가장 유명한 밭이라고 말해도 좋다. DRC는 이 밭 전체 면적을 단독소유하여[2] 와인을 생산한다. '로마네 콩티'라고 하면 부르고뉴 지방에서 가장 유명한 특급밭의 이름이자, 이 밭에서 생산된 와인을 지칭하는 것이고, '도멘 드 라 로마네 콩티' 또는 'DRC'라고 하면 로마네 콩티라는 밭을 소유하고 그 밭의 포도로 와인을 만들고 있는 회사(양조장)을 지칭하는 것이다. 양자간에 혼동을 일으키지 말 것.",
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 16,
                    ),
                  ),
                  const Text("\n\n"),
                  const Text(
                    "역사",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Text("\n"),
                  Text(
                    "자크-마리 뒤보(Jacques-Marie Duvault)와 소피 블로셰(Sophie Blochet)가 결혼 (1817) 뒤보가 79세가 되던 해에 로마네 콩티 포도밭 구입 (1869) 뒤보 사망 후 두 딸 클로딘 콩스탕스 마상(Claudine-Constance Massin), 앙리에트 뒤퓌(Henriette Dupuis)에게 상속 두 딸 모두 사망한 뒤 직계 상속인이 없어 조카인 자크 샹봉(Jacques Chambon), 마리-도미니크 고당 드 빌렌(Marie-Dominique Gaudin de Villaine)에게 분할 상속 빌렌가(家)에서는 이후 고당 드 빌렌의 직계인 에드몽(Edmond) -> 앙리(Henri) -> 오베르(Aubert)로 지분이 상속됨 샹봉가(家)의 지분은 자크 샹봉이 앙리 르루아(Henri Leroy)에게 매각. 앙리 르루아는 그 딸인 폴린 로크(Pauline Roch), 랄루 비즈(Marcelle(Lalou) Bize)[3]에게 지분을 분할 상속 1942년부터 드 빌렌 + 르루아/로크 가문의 공동 소유로 운영 균등상속[4]에 의한 포도원의 분할을 막기 위해 '도멘 드 라 로마네 콩티'라는 법인을 설립하고 법인 체제로 전환.1974~1991년까지 오베르 드 빌렌 + 랄루 비즈 르루아가 공동 경영 1991년 랄루 비즈 르루아는 경영상의 의견 차이로 지분을 조카(언니 폴린의 큰 아들) 샤를 로크(Charles Roch)에게 넘기고 손을 뗌 1992년 샤를 로크의 사망으로 해당 지분은 샤를의 동생인 앙리 프레데릭 로크(Henri-Frédéric Roch)[5] 에게 상속 2018년 앙리의 사망으로 랄루 비즈 르루아의 딸 페린 프날(Perrine Fenal)이 지분을 상속하여 오베르 드 빌렌과 공동 경영 2022년, 오베르 드 빌렌이 공동 대표직에서 공식적으로 물러나고, 후임은 조카인 베르트랑(Bertrand) 드 빌렌이 맡게 됨",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 5,
          child: Container(
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: const Color(0xFF3EC8A7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () async {
                  final url =
                      Uri.parse('https://www.treasurer.co.kr/item/100156');
                  if (await canLaunchUrl(url)) {
                    launchUrl(url);
                  } else {}
                },
                borderRadius: BorderRadius.circular(20),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      "사러 가기",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class InfoTable extends StatelessWidget {
  final Map<String, String> infoMap = {
    "모델명": "2010 Romanee-Saint-Vivant Grand Cru, Marey-Monge 3btls",
    "지역": "France / Burgundy / Romanee-Conti Grand Cru",
    "와인너리": "도멘 드 라 로마네 꽁띠",
    "와인 스타일": "Red Wine",
    "품종": "피노누아"
  };

  InfoTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 25.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.top,
        columnWidths: const {
          0: FixedColumnWidth(120.0),
          1: FlexColumnWidth(),
        },
        children: infoMap.entries
            .expand(
              (e) => [
                TableRow(
                  children: [
                    Text(
                      e.key,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      e.value,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const TableRow(
                    children: [SizedBox(height: 30), SizedBox(height: 30)]),
              ],
            )
            .toList()
          ..removeLast(),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final List<String> infoText;
  const InfoCard({
    super.key,
    required this.infoText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: infoText.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.circle,
                        size: 10,
                        color: Colors.grey,
                      ),
                      const Text("  "),
                      Text(
                        infoText[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFA2CCC2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => {},
                  borderRadius: BorderRadius.circular(10),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        "자세히 보기",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
