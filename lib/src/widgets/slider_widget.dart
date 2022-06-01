import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realstatepredicter/src/providers/label_provider.dart';

class SliderWidget extends StatefulWidget {
  double value;
  final double min;
  final double max;
  final String type;
  List<String> labels;
  SliderWidget({required this.value, required this.min, required this.max, required this.type, this.labels = const[] , Key? key}) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {

    return Consumer(
      builder: (_, ref, ___) {
        final labelProv = ref.watch(labelProvider);
        return Slider(
          value: (widget.type == "value") ? labelProv.garageCapacity : labelProv.quality,
          min: widget.min,
          divisions: (widget.max-widget.min).toInt(),
          label: (widget.type == "value") ? labelProv.garageCapacity.toString() : widget.labels[(labelProv.quality-widget.min).toInt()],
          max: widget.max,
          onChanged: (v){
            setState(() {
              widget.value = v;
              (widget.type == "value") ? labelProv.garageCapacity = v : labelProv.quality = v;
            });
          },
        );
      } ,
    );
  }
}
