part of 'widgets.dart';

class FmFoodItemOrderedProgress extends StatelessWidget {
  final Food food;
  final int quantity;
  final double width;

  FmFoodItemOrderedProgress({
    @required this.food,
    @required this.quantity,
    @required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 60,
          width: 60,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(food.picturePath),
            ),
          ),
        ),
        SizedBox(
          width: width - 72,
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
                '$quantity items • ' +
                    NumberFormat.currency(
                      symbol: 'IDR ',
                      decimalDigits: 0,
                      locale: 'id-ID',
                    ).format(food.price * quantity),
                style: tSubtitleFontSyle,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
