part of 'widgets.dart';

class FmButton extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Color color;
  final Function onPressed;

  FmButton({this.text, this.textStyle, this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      width: double.infinity,
      child: RaisedButton(
        padding: EdgeInsets.symmetric(vertical: 12),
        onPressed: () {
          if (onPressed != null) onPressed();
        },
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: color,
        child: Text(text, style: textStyle),
      ),
    );
  }
}
