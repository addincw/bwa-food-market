part of 'widgets.dart';

class FmFoodItem extends StatelessWidget {
  final Food food;
  final double width;

  FmFoodItem({@required this.food, this.width});

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
          width: width - 182,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                food.name,
                style: tLabelFontSyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(food.price.toString(), style: tLabelFontSyle, maxLines: 1),
            ],
          ),
        ),
        FmRating(stars: food.rate),
      ],
    );
  }
}
