part of 'widgets.dart';

class FmTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelName;
  final bool isEditable;

  FmTextField({this.controller, this.labelName, this.isEditable = true});

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
            controller: controller,
            enabled: isEditable,
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
