part of 'pages.dart';

class SignupAddressPage extends StatefulWidget {
  @override
  _SignupAddressPageState createState() => _SignupAddressPageState();
}

class _SignupAddressPageState extends State<SignupAddressPage> {
  @override
  Widget build(BuildContext context) {
    return GeneralLayout(
      title: "Address",
      subtitle: "Make sure it's valid",
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
            FmTextField(labelName: "Phone Number"),
            FmTextField(labelName: "Address"),
            FmTextField(labelName: "House Number"),
            FmSelectionField(labelName: "City"),
            SizedBox(height: 8.0),
            FmButton(
              text: "Sign Up Now",
              textStyle: tButtonPrimaryFontSyle,
              color: tPrimaryColor,
              onPressed: () {
                Get.to(MainPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
