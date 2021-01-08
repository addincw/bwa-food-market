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
    context.watch<FoodCubit>().getAll();

    return ListView(
      children: [
        _renderFoodHeader(),
        _renderFoodListCard(),
        _renderFoodListItem(),
        // Container(color: tBackgroundColor, height: 16)
      ],
    );
  }

  Container _renderFoodHeader() {
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
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image:
                        NetworkImage((state as AuthSignedIn).user.picturePath),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Container _renderFoodListCard() {
    return Container(
      height: 258,
      width: double.infinity,
      color: tBackgroundColor,
      alignment: Alignment.center,
      child: BlocBuilder<FoodCubit, FoodState>(
        builder: (context, state) {
          if (state is FoodInitial) {
            return Center(
              child: Loading(
                indicator: BallPulseIndicator(),
                size: 20,
                color: tPrimaryColor,
              ),
            );
          }

          return ListView(
            padding: EdgeInsets.only(left: tDefaultPadding),
            scrollDirection: Axis.horizontal,
            children: [
              Row(
                children: (state as FoodLoaded)
                    .foods
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
          );
        },
      ),
    );
  }

  Container _renderFoodListItem() {
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
            if (context.watch<FoodCubit>().state is FoodInitial ||
                context.watch<FoodCubit>().state is FoodLoadFailed) {
              return Center(
                child: Loading(
                  indicator: BallPulseIndicator(),
                  size: 20,
                  color: tPrimaryColor,
                ),
              );
            }

            List<Food> foods =
                (context.watch<FoodCubit>().state as FoodLoaded).foods;
            switch (categoryTabIndex) {
              case 0:
                foods = foods.length > 0
                    ? foods
                        .where((food) =>
                            food.categories.contains(FoodCategory.new_food))
                        .toList()
                    : [];
                break;
              case 1:
                foods = foods.length > 0
                    ? foods
                        .where((food) =>
                            food.categories.contains(FoodCategory.popular))
                        .toList()
                    : [];
                break;
              case 2:
                foods = foods.length > 0
                    ? foods
                        .where((food) =>
                            food.categories.contains(FoodCategory.recommended))
                        .toList()
                    : [];
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
