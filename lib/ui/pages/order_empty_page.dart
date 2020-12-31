part of 'pages.dart';

class OrderEmptyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: IllustrationLayout(
            illustrationPath: 'assets/love_burger.png',
            title: 'Ouch! Hungry',
            description: 'Seems like you have not ordered any food yet',
            actionPrimaryTitle: 'Find Foods',
            actionPrimaryOnPressed: () {},
          ),
        ),
      ),
    );
  }
}
