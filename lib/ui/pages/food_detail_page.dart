part of 'pages.dart';

class FoodDetailPage extends StatefulWidget {
  final Food food;

  const FoodDetailPage({this.food});

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  final foodImageHeight = 330.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(color: Colors.white),
            Image.network(
              widget.food.picturePath,
              width: double.infinity,
              height: foodImageHeight,
              fit: BoxFit.fill,
            ),
            ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        top: tDefaultPadding,
                      ),
                      child: FmButtonBack(
                        isOverlay: true,
                        onBackButtonPressed: () {},
                      ),
                    ),
                    SizedBox(height: foodImageHeight - 70),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(16, tDefaultPadding, 16, 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.food.name,
                                    style: tLabelFontSyle,
                                    maxLines: 1,
                                  ),
                                  SizedBox(height: 6),
                                  FmRating(stars: widget.food.rate),
                                ],
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Image.asset(
                                      'assets/btn_min.png',
                                      width: 26,
                                      height: 26,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Text('1', style: tLabelFontSyle),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Image.asset(
                                      'assets/btn_add.png',
                                      width: 26,
                                      height: 26,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          Text(
                            widget.food.description,
                            style: tSubtitleFontSyle,
                          ),
                          SizedBox(height: 16),
                          Text('Ingredients:', style: tButtonPrimaryFontSyle),
                          Text(
                            widget.food.ingredients,
                            style: tSubtitleFontSyle,
                          ),
                          SizedBox(height: 40),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 80,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Price:',
                  style: tSubtitleFontSyle,
                ),
                Text(
                  NumberFormat.currency(
                    symbol: 'IDR ',
                    decimalDigits: 0,
                    locale: 'id-ID',
                  ).format(widget.food.price),
                  style: tLabelFontSyle,
                  maxLines: 1,
                ),
              ],
            ),
            Container(
              width: 163,
              child: FmButton(
                color: tPrimaryColor,
                text: 'Order Now',
                textStyle: tButtonPrimaryFontSyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
