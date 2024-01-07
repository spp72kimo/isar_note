import 'package:flutter/material.dart';

class NoteSettings extends StatelessWidget {
  const NoteSettings({
    super.key,
    required this.onEditTap,
    required this.onDeleteTap,
  });
  final void Function()? onEditTap;
  final void Function()? onDeleteTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            onEditTap!();
          },
          child: Container(
            height: 50,
            color: Theme.of(context).colorScheme.background,
            child: Center(
                child: Text(
              "Edit",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            )),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            onEditTap!();
          },
          child: Container(
            height: 50,
            color: Theme.of(context).colorScheme.background,
            child: Center(
                child: Text(
              "Delete",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            )),
          ),
        ),
      ],
    );
  }
}
