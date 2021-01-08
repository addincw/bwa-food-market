part of 'pages.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage>
    with SingleTickerProviderStateMixin {
  TabController categoryTabController;
  List<Tab> categoryTabs = [Tab(text: 'In Progress'), Tab(text: 'Past Orders')];
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
    context.watch<TransactionCubit>().getAll();
    // List<Transaction> transactionInProgress = [];
    // List<Transaction> transactionPast = [];

    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (BuildContext context, state) {
        if (state is TransactionLoadFailed || state is TransactionInitial) {
          return Center(
            child: Loading(
              indicator: BallPulseIndicator(),
              size: 20,
              color: tPrimaryColor,
            ),
          );
        }

        List<Transaction> transactionInProgress = (state as TransactionLoaded)
            .transactions
            .where((transaction) =>
                transaction.status == TransactionStatus.on_delivery ||
                transaction.status == TransactionStatus.pending)
            .toList();

        List<Transaction> transactionPast = (state as TransactionLoaded)
            .transactions
            .where((transaction) =>
                transaction.status == TransactionStatus.delivered ||
                transaction.status == TransactionStatus.cancelled)
            .toList();

        if (transactionInProgress.length == 0 && transactionPast.length == 0) {
          return OrderEmptyPage();
        }

        return GeneralLayout(
          title: 'Your Orders',
          subtitle: 'Wait for the best meal',
          child: Column(
            children: [
              TabBar(
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
              Builder(builder: (context) {
                List<Widget> transactionItems = [];

                switch (categoryTabIndex) {
                  case 0:
                    transactionItems = transactionInProgress
                        .map(
                          (transaction) => Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(OrderCheckoutPage(
                                    transaction: transaction));
                              },
                              child: FmFoodItemOrderedProgress(
                                food: transaction.food,
                                quantity: transaction.quantity,
                                width: MediaQuery.of(context).size.width -
                                    (2 * tDefaultPadding),
                              ),
                            ),
                          ),
                        )
                        .toList();
                    break;

                  case 1:
                    transactionItems = transactionPast
                        .map(
                          (transaction) => Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: GestureDetector(
                              onTap: () {},
                              child: FmFoodItemOrderedHistory(
                                transaction: transaction,
                                width: MediaQuery.of(context).size.width -
                                    (2 * tDefaultPadding),
                              ),
                            ),
                          ),
                        )
                        .toList();
                    break;
                }

                return Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(
                    top: 16,
                    left: tDefaultPadding,
                    right: tDefaultPadding,
                  ),
                  child: Column(children: transactionItems),
                );
              }),
            ],
          ),
        );
      },
    );
  }
}
