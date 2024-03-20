import 'package:flutter/material.dart';

class PriceSlider extends StatefulWidget {
  final double min;
  final double max;
  const PriceSlider({Key? key, required this.min, required this.max}) : super(key: key);

  @override
  State<PriceSlider> createState() => _PriceSliderState();
}

class _PriceSliderState extends State<PriceSlider> {
  late RangeValues _currentRangeValues;

  @override
  void initState() {
    super.initState();
    // Initialize _currentRangeValues with the min and max values passed to the widget
    _currentRangeValues = RangeValues(widget.min, widget.max);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RangeSlider(
          values: _currentRangeValues,
          min: widget.min,
          max: widget.max,
          divisions: 100,
          labels: RangeLabels(
            _currentRangeValues.start.round().toString(),
            _currentRangeValues.end.round().toString(),
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_currentRangeValues.start.round().toString()),
            Text(_currentRangeValues.end.round().toString()),
          ],
        ),
      ],
    );
  }
}
