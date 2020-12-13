part of 'widgets.dart';

class FmRating extends StatelessWidget {
  FmRating({this.stars});

  final int stars;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List<Widget>.generate(
            5,
            (index) => Icon(
              index < stars ? MdiIcons.star : MdiIcons.starOutline,
              size: 16,
              color: tPrimaryColor,
            ),
          ) +
          [
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text('$stars'),
            )
          ],
    );
  }
}
