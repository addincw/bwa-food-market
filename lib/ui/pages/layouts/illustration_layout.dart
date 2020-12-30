part of 'layouts.dart';

class IllustrationLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/love_burger.png'),
              ),
            ),
          ),
          Text(
            'Illustration Page',
            style: tLabelFontSyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
