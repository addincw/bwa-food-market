part of 'pages.dart';

class OrderCheckoutPage extends StatelessWidget {
  final Transaction transaction;

  OrderCheckoutPage({this.transaction});

  @override
  Widget build(BuildContext context) {
    var totalFoodPrice = transaction.food.price * transaction.quantity;
    var driverPrice = 50000;
    var taxPrice = totalFoodPrice * 0.1;
    var totalPrice = totalFoodPrice + driverPrice + taxPrice;

    return GeneralLayout(
      title: 'Payment',
      subtitle: 'You deserve better meal',
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: tDefaultPadding,
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Item Ordered', style: tButtonPrimaryFontSyle),
                SizedBox(height: 12),
                FmFoodItemOrdered(
                  food: transaction.food,
                  quantity: transaction.quantity,
                  width:
                      MediaQuery.of(context).size.width - (2 * tDefaultPadding),
                ),
                SizedBox(height: 16),
                Text('Detail Transaction', style: tButtonPrimaryFontSyle),
                SizedBox(height: 8),
                renderDetailItem(
                  name: transaction.food.name,
                  value: NumberFormat.currency(
                    symbol: 'IDR ',
                    decimalDigits: 0,
                    locale: 'id-ID',
                  ).format(totalFoodPrice),
                ),
                renderDetailItem(
                  name: 'Driver',
                  value: NumberFormat.currency(
                    symbol: 'IDR ',
                    decimalDigits: 0,
                    locale: 'id-ID',
                  ).format(driverPrice),
                ),
                renderDetailItem(
                  name: 'Tax 10%',
                  value: NumberFormat.currency(
                    symbol: 'IDR ',
                    decimalDigits: 0,
                    locale: 'id-ID',
                  ).format(taxPrice),
                ),
                renderDetailItem(
                  name: 'Total Price',
                  value: NumberFormat.currency(
                    symbol: 'IDR ',
                    decimalDigits: 0,
                    locale: 'id-ID',
                  ).format(totalPrice),
                  isHightlight: true,
                ),
              ],
            ),
          ),
          Container(color: tBackgroundColor, height: tDefaultMargin),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: tDefaultPadding,
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Deliver to:', style: tButtonPrimaryFontSyle),
                SizedBox(height: 8),
                renderDetailItem(
                  name: 'Name',
                  value: transaction.user.name,
                ),
                renderDetailItem(
                  name: 'Phone No.',
                  value: transaction.user.phoneNumber,
                ),
                renderDetailItem(
                  name: 'Address',
                  value: transaction.user.address,
                ),
                renderDetailItem(
                  name: 'House No.',
                  value: transaction.user.houseNumber,
                ),
                renderDetailItem(
                  name: 'City',
                  value: transaction.user.city,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomActionBar: Container(
        color: Colors.white,
        width: double.infinity,
        height: 80,
        padding:
            EdgeInsets.symmetric(horizontal: tDefaultPadding, vertical: 16),
        child: FmButton(
          text: 'Checkout Now',
          textStyle: tButtonPrimaryFontSyle,
          color: tPrimaryColor,
        ),
      ),
    );
  }

  Widget renderDetailItem({name, value, isHightlight = false}) {
    var valueStyle = isHightlight
        ? tButtonPrimaryFontSyle.copyWith(
            color: Color(0xFF1ABC9C),
          )
        : tButtonPrimaryFontSyle;

    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: tSubtitleFontSyle),
          Text(value, style: valueStyle),
        ],
      ),
    );
  }
}
