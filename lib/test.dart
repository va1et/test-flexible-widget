import 'package:flutter/material.dart';

///[Widget for custom flexible row  which consists of 3 elements: text, line and checkbox]
class CustomFlexibleWidget extends StatelessWidget {
  final String text;
  final bool isSelected;

  const CustomFlexibleWidget(
      {Key? key, required this.text, required this.isSelected})
      : super(key: key);

  ///[Width of text widget] count width of text to make right condition for width of screen calculation
  double _textSize(
    String text,
  ) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: text,
        ),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Row(
        children: [
          //Text
          Flexible(
              flex: MediaQuery.of(context).size.width >= 80 + _textSize(text)
                  ? 0
                  : 1,
              fit: FlexFit.loose,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return MediaQuery.of(context).size.width >=
                          80 + _textSize(text)
                      ? Text(
                          text,
                        )
                      : Text(
                          text,
                          overflow: TextOverflow.ellipsis,
                        );
                },
              )),
          const VerticalDivider(
            color: Colors.black,
            thickness: 1,
          ),
          //Line
          Expanded(
              flex: MediaQuery.of(context).size.width >= 80 + _textSize(text)
                  ? 1
                  : 0,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return constraints.maxWidth >= 10
                      ? Container(
                          height: 2.0,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.black,
                                width: 0.5,
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox();
                },
              )),
          const VerticalDivider(
            color: Colors.black,
            thickness: 1,
          ),
          //Checkbox
          Flexible(
              flex: 0,
              child: Checkbox(
                value: isSelected,
                onChanged: (bool? value) {
                  // Logic of checkbox
                },
              )),
        ],
      ),
    );
  }
}
