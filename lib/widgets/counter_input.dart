import 'package:ayur_clinic_portal/core/constants.dart';
import 'package:flutter/material.dart';

class CounterInput extends StatefulWidget {
  final String label;
  final int initialValue;
  final ValueChanged<int>? onChanged;

  const CounterInput({
    Key? key,
    required this.label,
    this.initialValue = 0,
    this.onChanged,
  }) : super(key: key);

  @override
  _CounterInputState createState() => _CounterInputState();
}

class _CounterInputState extends State<CounterInput> {
  late int _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.label, style: const TextStyle(fontSize: 16.0)),
        const SizedBox(width: 8.0),
        IconButton(
          icon: const Icon(
            Icons.remove_circle_outline,
            color: AppColors.primaryGreen,
          ),
          onPressed: _value > 0
              ? () => setState(() {
                  _value--;
                  if (widget.onChanged != null) widget.onChanged!(_value);
                })
              : null,
        ),
        Text('$_value', style: const TextStyle(fontSize: 16.0)),
        IconButton(
          icon: const Icon(
            Icons.add_circle_outline,
            color: AppColors.primaryGreen,
          ),
          onPressed: () => setState(() {
            _value++;
            if (widget.onChanged != null) widget.onChanged!(_value);
          }),
        ),
      ],
    );
  }
}
