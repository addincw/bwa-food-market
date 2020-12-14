part of 'widgets.dart';

class FmFoodCard extends StatelessWidget {
  const FmFoodCard({
    Key key,
    @required this.food,
  }) : super(key: key);

  final Food food;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      child: Container(
        height: 210,
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(food.picturePath),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(food.name, style: tLabelFontSyle, maxLines: 1),
                  SizedBox(height: 6),
                  FmRating(stars: food.rate),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
