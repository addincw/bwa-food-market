part of 'pages.dart';

class OrderSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: IllustrationLayout(
            illustrationPath: 'assets/bike.png',
            title: 'You’ve Made Order',
            description:
                'Just stay at home while we are preparing your best foods',
            actionPrimaryTitle: 'Find Foods',
            actionPrimaryOnPressed: () {},
            actionSecondaryTitle: 'View My Order',
            actionSecondaryOnPressed: () {},
          ),
        ),
      ),
    );
  }
}
