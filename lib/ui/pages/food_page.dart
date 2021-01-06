part of 'pages.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage>
    with SingleTickerProviderStateMixin {
  TabController categoryTabController;
  List<Tab> categoryTabs = [
    Tab(text: 'New Taste'),
    Tab(text: 'Popular'),
    Tab(text: 'Recomended'),
  ];
  int categoryTabIndex = 0;

  @override
  void initState() {
    super.initState();
    categoryTabController = TabController(
      length: categoryTabs.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    categoryTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        renderFoodHeader(),
        renderFoodListCard(),
        renderFoodListItem(),
        // Container(color: tBackgroundColor, height: 16)
      ],
    );
  }

  Container renderFoodHeader() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(tDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("FoodMarket", style: tTitleFontSyle),
              Text("Let's get some foods", style: tSubtitleFontSyle),
            ],
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1569124589354-615739ae007b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')),
            ),
          )
        ],
      ),
    );
  }

  Container renderFoodListCard() {
    return Container(
      height: 258,
      width: double.infinity,
      color: tBackgroundColor,
      alignment: Alignment.center,
      child: ListView(
        padding: EdgeInsets.only(left: tDefaultPadding),
        scrollDirection: Axis.horizontal,
        children: [
          Row(
            children: mockFoods
                .map(
                  (food) => Padding(
                    padding: EdgeInsets.only(right: tDefaultPadding),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(FoodDetailPage(food: food));
                      },
                      child: FmFoodCard(food: food),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }

  Container renderFoodListItem() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      // margin: EdgeInsets.only(bottom: 19),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xFFF2F2F2), width: 1),
              ),
            ),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicator: MD2Indicator(
                indicatorHeight: 3,
                indicatorColor: Colors.black,
                indicatorSize: MD2IndicatorSize.normal,
              ),
              labelColor: Colors.black,
              labelStyle: tButtonPrimaryFontSyle,
              unselectedLabelColor: tSubtitleColor,
              unselectedLabelStyle: tSubtitleFontSyle,
              controller: categoryTabController,
              tabs: categoryTabs,
              onTap: (tabIndex) {
                setState(() {
                  categoryTabIndex = tabIndex;
                });
              },
            ),
          ),
          Builder(builder: (context) {
            List<Food> foods = [];
            switch (categoryTabIndex) {
              case 0:
                foods = mockFoods;
                break;
              default:
                foods = [];
                break;
            }

            return Container(
              color: Colors.white,
              padding: const EdgeInsets.only(
                top: 16,
                left: tDefaultPadding,
                right: tDefaultPadding,
              ),
              child: Column(
                children: foods
                    .map(
                      (food) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(FoodDetailPage(food: food));
                          },
                          child: FmFoodItem(
                            food: food,
                            width: MediaQuery.of(context).size.width -
                                (2 * tDefaultPadding),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            );
          }),
        ],
      ),
    );
  }
}
