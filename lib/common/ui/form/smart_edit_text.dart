import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:irunner/common/ui/base/base_text.dart';
import 'package:irunner/common/ui/form/basic.dart';

// ignore: must_be_immutable
class BasicEditText extends BasicInputWidget {

  int titleRatio, valueRatio;

  bool titleBold;

  BasicEditText(WorkOrder data, {this.titleRatio: 1, this.valueRatio: 4, this.titleBold: false}) : super(data);

  @override
  _BasicSingleInputState createState() => _BasicSingleInputState();
}

class _BasicSingleInputState extends State<BasicSingleInput> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.notifier,
      builder: (context, value, child) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: Row(
            children: [
              Expanded(
                flex: widget.titleRatio ?? 1,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: BaseText(
                    '${widget.data.title ?? ''}：',
                    size: 12,
                    bold: widget.titleBold,
                  ),
                )
              ),
              Container(
                child: Expanded(
                  flex: widget.valueRatio ?? 4,
                  child: CupertinoTextField(
                    minLines: 1,
                    maxLines: 1,
                    // placeholder: widget.tips,
                    placeholder: widget.data.tips ?? '',
                    style: TextStyle(fontSize: 12),
                    onChanged: (String result) {
                      widget.data.defaultValue = result;
                    },
                    controller: TextEditingController.fromValue(
                      TextEditingValue(
                        // text: widget.defaultValue,
                        text: widget.data.defaultValue,
                      ),
                    )
                  ),
                )
              ),
              // ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: BaseText(
                  // '${widget.unit}',
                  '${widget.data.unit ?? ''}',
                  size: 12,
                  // bold: true,
                  color: Colors.black,
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
