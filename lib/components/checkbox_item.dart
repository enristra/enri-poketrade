import 'package:flutter/material.dart';

class CheckBoxItemObject<T>{
  late T value;
  late bool checked;

  CheckBoxItemObject({required this.value, this.checked=false});

  check(bool value){
    checked = value;
  }
}

class CheckBoxItem<T> extends StatefulWidget {

  final CheckBoxItemObject<T> value;
  const CheckBoxItem({Key? key, required this.value}) : super(key: key);

  @override
  State<CheckBoxItem<T>> createState() => _CheckBoxItemState<T>();

  bool getCheck(){
    return value.checked;
  }
}

class _CheckBoxItemState<T> extends State<CheckBoxItem<T>> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.value.value.toString()),
        Checkbox(
          value: widget.value.checked,
          onChanged: (status){
            if(status == null){
              return;
            }
            setState(() {
              widget.value.check(status);
            });
            },
        )
      ],
    );
  }
}
