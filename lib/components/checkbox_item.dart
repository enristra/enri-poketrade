import 'package:flutter/material.dart';

class CheckBoxItemObject<T>{
  late T value;
  late bool checked;
  late String label;

  CheckBoxItemObject({required this.value, this.checked=false, required this.label});

  check(bool value){
    checked = value;
  }
}

class CheckBoxItem<T> extends StatefulWidget {

  final CheckBoxItemObject<T> value;
  final Function()? onPressed;
  const CheckBoxItem({Key? key, required this.value, this.onPressed}) : super(key: key);

  @override
  State<CheckBoxItem<T>> createState() => _CheckBoxItemState<T>();

  bool getCheck(){
    return value.checked;
  }
}

class _CheckBoxItemState<T> extends State<CheckBoxItem<T>> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.value.checked;
  }

  @override
  void didUpdateWidget(CheckBoxItem<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    isChecked = widget.value.checked;
  }

  void toggleChecked() {
    setState(() {
      isChecked = !isChecked;
      widget.value.check(isChecked);
    });

    if (widget.onPressed != null) {
      widget.onPressed!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.value.label),
        Checkbox(
          value: isChecked,
          onChanged: (_) => toggleChecked(),
        )
      ],
    );
  }
}
