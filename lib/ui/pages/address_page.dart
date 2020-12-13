part of 'pages.dart';

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
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
            FmButton(
              text: "Sign Up Now",
              textStyle: tButtonPrimaryFontSyle,
              color: tPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
