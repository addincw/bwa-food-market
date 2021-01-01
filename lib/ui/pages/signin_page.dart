part of 'pages.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return GeneralLayout(
      title: "Sign In",
      subtitle: "Find your best meal ever",
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: tDefaultPadding,
          vertical: tDefaultPadding,
        ),
        child: Column(
          children: [
            FmTextField(labelName: "Email Address"),
            FmTextField(labelName: "Password"),
            FmButton(
              text: "Sign In",
              textStyle: tButtonPrimaryFontSyle,
              color: tPrimaryColor,
            ),
            SizedBox(height: 8.0),
            FmButton(
              text: "Create New Account",
              textStyle: tButtonSecondaryFontSyle,
              color: tSubtitleColor,
              onPressed: () {
                Get.to(SignupPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
