part of 'widgets.dart';

class FmButton extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Color color;
  final bool isLoading;
  final Function onPressed;

  FmButton({
    this.text,
    this.textStyle,
    this.color,
    this.isLoading = false,
    this.onPressed,
  });

  _onPressed() {
    if (onPressed != null) onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 12),
        onPressed: isLoading ? null : _onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: color,
        disabledColor: color,
        child: isLoading
            ? Loading(indicator: BallPulseIndicator(), size: 20)
            : Text(text, style: textStyle),
      ),
    );
  }
}
