part of 'layouts.dart';

class GeneralLayout extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onBackButtonPressed;
  final Widget child;

  GeneralLayout({
    this.title = "",
    this.subtitle = "",
    this.onBackButtonPressed,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(color: Colors.white),
            ListView(
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(tDefaultPadding),
                      width: double.infinity,
                      height: 108,
                      color: Colors.white,
                      child: Row(
                        children: [
                          renderBackButton(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: tTitleFontSyle,
                              ),
                              Text(
                                subtitle,
                                style: tSubtitleFontSyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: tDefaultPadding,
                      width: double.infinity,
                      color: tBackgroundColor,
                    ),
                    child ?? SizedBox()
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget renderBackButton() {
    if (this.onBackButtonPressed != null) {
      return GestureDetector(
        onTap: onBackButtonPressed,
        child: Container(
          width: 24,
          height: 24,
          margin: EdgeInsets.only(right: 26),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/back_arrow.png'),
            ),
          ),
        ),
      );
    }

    return SizedBox();
  }
}
