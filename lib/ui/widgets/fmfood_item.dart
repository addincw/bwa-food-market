part of 'widgets.dart';

class FmFoodItem extends StatelessWidget {
  final Food food;
  final double width;

  FmFoodItem({@required this.food, @required this.width});

  @override
  Widget build(BuildContext context) {
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
          width: width * 0.45,
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
                NumberFormat.currency(
                  symbol: 'IDR ',
                  decimalDigits: 0,
                  locale: 'id-ID',
                ).format(food.price),
                style: tSubtitleFontSyle,
                maxLines: 1,
              ),
            ],
          ),
        ),
        FmRating(stars: food.rate),
      ],
    );
  }
}
