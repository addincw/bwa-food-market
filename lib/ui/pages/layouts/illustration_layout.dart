part of 'layouts.dart';

class IllustrationLayout extends StatelessWidget {
  final String illustrationPath;
  final String title;
  final String description;
  final String actionPrimaryTitle;
  final Function actionPrimaryOnPressed;
  final String actionSecondaryTitle;
  final Function actionSecondaryOnPressed;

  const IllustrationLayout({
    @required this.illustrationPath,
    @required this.title,
    @required this.description,
    @required this.actionPrimaryTitle,
    @required this.actionPrimaryOnPressed,
    this.actionSecondaryTitle,
    this.actionSecondaryOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> actions = [
      FmButton(
        color: tPrimaryColor,
        text: actionPrimaryTitle,
        textStyle: tButtonPrimaryFontSyle,
      )
    ];

    if (actionSecondaryTitle != null) {
      actions.addAll([
        SizedBox(height: 8.0),
        FmButton(
          color: tSubtitleColor,
          text: actionSecondaryTitle,
          textStyle: tButtonSecondaryFontSyle,
        )
      ]);
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            illustrationPath,
            width: 200,
            fit: BoxFit.fitWidth,
          ),
          Container(
            width: 200,
            margin: EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins().copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 6),
                Text(
                  description,
                  style: tSubtitleFontSyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            width: 200,
            margin: EdgeInsets.only(top: 30),
            child: Column(children: actions),
          )
        ],
      ),
    );
  }
}
