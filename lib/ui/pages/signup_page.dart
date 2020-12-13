part of 'pages.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return GeneralLayout(
      title: "Sign Up",
      subtitle: "Register and eat",
      onBackButtonPressed: () {
        Get.back();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: tDefaultPadding,
          vertical: tDefaultPadding,
        ),
        child: Column(
          children: [
            Container(
              width: 110,
              height: 110,
              margin: EdgeInsets.only(bottom: tDefaultMargin),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/photo_border.png'),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1569124589354-615739ae007b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            FmTextField(labelName: "Full Name"),
            FmTextField(labelName: "Email Address"),
            FmTextField(labelName: "Password"),
            FmButton(
              text: "Continue",
              textStyle: tButtonPrimaryFontSyle,
              color: tPrimaryColor,
              onPressed: () {
                Get.to(AddressPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
