part of 'widgets.dart';

class FmSelectionField extends StatelessWidget {
  final String labelName;

  FmSelectionField({this.labelName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelName, style: tLabelFontSyle),
        Container(
          margin: EdgeInsets.only(top: 6, bottom: 16),
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black),
          ),
          child: DropdownButton(
            isExpanded: true,
            underline: SizedBox(),
            items: [
              DropdownMenuItem(
                child: Text("Jakarta", style: tSubtitleFontSyle),
              ),
              DropdownMenuItem(
                child: Text("Surabaya", style: tSubtitleFontSyle),
              ),
              DropdownMenuItem(
                child: Text("Bandung", style: tSubtitleFontSyle),
              ),
            ],
            onChanged: (item) {},
          ),
        ),
      ],
    );
  }
}
