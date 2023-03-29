import 'package:flutter/material.dart';

class Entry extends StatefulWidget {
  String btnVal;
  String history;
  Entry(this.btnVal, this.history);

  @override
  State<Entry> createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "${widget.history}",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
          textAlign: TextAlign.end,
        ),
        Text(
          "${widget.btnVal}",
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
          textAlign: TextAlign.end,
        ),
      ],
    );
  }
}
