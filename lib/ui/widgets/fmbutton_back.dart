part of 'widgets.dart';

class FmButtonBack extends StatelessWidget {
  final bool isOverlay;
  final Function onBackButtonPressed;

  FmButtonBack({this.isOverlay = false, this.onBackButtonPressed});

  @override
  Widget build(BuildContext context) {
    if (this.onBackButtonPressed != null) {
      var icon = isOverlay ? 'back_arrow_white.png' : 'back_arrow.png';

      return GestureDetector(
        onTap: onBackButtonPressed,
        child: Container(
          width: 24,
          height: 24,
          margin: EdgeInsets.only(right: 26),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/' + icon)),
          ),
        ),
      );
    }

    return SizedBox();
  }
}
