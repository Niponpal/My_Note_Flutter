

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mynoteds/controller/add.dart';
import 'package:mynoteds/controller/update.dart';
import 'package:mynoteds/weidgets/text.dart';

class NoteAddEditScreen extends StatefulWidget {
  const NoteAddEditScreen({super.key, required this.screenType, this.noteTitle, this.note, this.id});

final String screenType;
final int? id;
final String? note;

final String? noteTitle;

  @override
  State<NoteAddEditScreen> createState() => _NoteAddEditScreenState();
}

class _NoteAddEditScreenState extends State<NoteAddEditScreen> {
  TextEditingController NoteC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    NoteC.text= widget.note ??"";
    log("=============${widget.id}==========");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        //bg color
        backgroundColor: Colors.green,
        title: CustomTextwidget(Title: "${widget.screenType}"),
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text("${widget.noteTitle}:",style: TextStyle(fontSize: 27,color: Color(0xff9A9A9A)),),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextField(
              controller: NoteC,
              maxLines: 30,
              style: TextStyle(
                color: Colors.white
              ),
              decoration: InputDecoration(
                hintText: "Description............",
                hintStyle: TextStyle(
                  color: Colors.white
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.all(12),

              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              log("=============${NoteC.text}");


           if(widget.screenType== "Note Add"){
             await NoteAddAPI.addNoteData(data: NoteC.text);
           }
           else{
             await NoteUpdate().NoteUpdateApi(id: widget.id ?? 0, Title: NoteC.text);
           }
           Navigator.pop(context);
            },
            child: Text("Save"),
          )

        ],
      ),
    );
  }
}
