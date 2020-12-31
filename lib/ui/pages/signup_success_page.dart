part of 'pages.dart';

class SignupSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: IllustrationLayout(
            illustrationPath: 'assets/food_wishes.png',
            title: 'Yeay! Completed',
            description:
                'Now you are able to order some foods as a self-reward',
            actionPrimaryTitle: 'Find Foods',
            actionPrimaryOnPressed: () {},
          ),
        ),
      ),
    );
  }
}
