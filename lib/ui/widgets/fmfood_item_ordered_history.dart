part of 'widgets.dart';

class FmFoodItemOrderedHistory extends StatelessWidget {
  final Transaction transaction;
  final double width;

  FmFoodItemOrderedHistory({@required this.transaction, @required this.width});

  @override
  Widget build(BuildContext context) {
    var food = transaction.food;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(food.picturePath),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.53,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                food.name,
                style: tLabelFontSyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '${transaction.quantity} items • ' +
                    NumberFormat.currency(
                      symbol: 'IDR ',
                      decimalDigits: 0,
                      locale: 'id-ID',
                    ).format(food.price * transaction.quantity),
                style: tSubtitleFontSyle,
                maxLines: 1,
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(new DateFormat("MMM d, HH:m").format(transaction.dateTime)),
            renderTransactionStatusString(),
          ],
        ),
      ],
    );
  }

  Text renderTransactionStatusString() {
    var status;

    switch (transaction.status) {
      case TransactionStatus.pending:
        status = Text('Pending', style: tLabelFontSyle);
        break;
      case TransactionStatus.on_delivery:
        status = Text(
          'On Delivery',
          style: tSubtitleFontSyle.copyWith(color: tPrimaryColor),
        );
        break;
      case TransactionStatus.delivered:
        status = Text(
          'Delivered',
          style: tSubtitleFontSyle.copyWith(color: Color(0xFF1ABC9C)),
        );
        break;
      case TransactionStatus.cancelled:
        status = Text(
          'Cancelled',
          style: tSubtitleFontSyle.copyWith(color: Color(0xFFD9435E)),
        );
        break;
      default:
        status = Text('Pending', style: tSubtitleFontSyle);
    }

    return status;
  }
}
