
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mynoteds/controller/delete.dart';
import 'package:mynoteds/controller/get.dart';
import 'package:mynoteds/screen/details/ui.dart';
import 'package:mynoteds/screen/noted_add_edit/ui.dart';

import '../../../weidgets/text.dart';

class NoteCardWeigets extends StatelessWidget {
  const NoteCardWeigets({
    super.key, required this.data, required this.onDelete, required this.onEdit,
  });

  final Map data;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  get noteDatas => null;

  get index => null;

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onLongPress: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NoteDetailsPage(note: data),
          ),
        );

      },
      child: Card(
        elevation: 5,
        color: Color(0xffFF9E9E),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 8,
                child: CustomTextwidget(
                  Title: data['note'],
                  color: Colors.black,
                  fW: FontWeight.w800,
                  maxLine: 3,
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  spacing: 28,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: onEdit,
                      child: Icon(Icons.edit_calendar),
                    ),
                    InkWell(
                      onTap: onDelete,
                      child: Icon(Icons.delete_forever, color: Colors.red,),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
