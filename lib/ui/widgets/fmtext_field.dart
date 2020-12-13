part of 'widgets.dart';

class FmTextField extends StatelessWidget {
  final String labelName;

  FmTextField({this.labelName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelName, style: tLabelFontSyle),
        Container(
          margin: EdgeInsets.only(top: 6, bottom: 16),
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black),
          ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: tSubtitleFontSyle,
              hintText: "Type your " + labelName.toLowerCase(),
            ),
          ),
        ),
      ],
    );
  }
}
