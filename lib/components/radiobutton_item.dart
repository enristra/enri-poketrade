import 'package:flutter/material.dart';

class RadioButtonObject<T>{
  late T value;
  late T groupValue;
  late bool checked;

  RadioButtonObject({required this.value, this.checked=false, required this.groupValue});

}

class RadioButtonItem<T> extends StatefulWidget {

  final RadioButtonObject<T> value;
  final Function(T? value) onChanged;
  const RadioButtonItem({Key? key, required this.value, required this.onChanged}) : super(key: key);

  @override
  State<RadioButtonItem<T>> createState() => _RadioButtonItemState<T>();

}

class _RadioButtonItemState<T> extends State<RadioButtonItem<T>> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.value.value.toString()),
        Radio<T>(
          groupValue: widget.value.groupValue,
          value: widget.value.value,
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
