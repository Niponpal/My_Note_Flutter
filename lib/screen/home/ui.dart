import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mynoteds/controller/add.dart';
import 'package:mynoteds/controller/get.dart';
import 'package:mynoteds/controller/modelget.dart';
import 'package:mynoteds/model/note_model.dart';
import 'package:mynoteds/screen/home/weidgets/notedCardWeigets.dart';
import 'package:mynoteds/screen/noted_add_edit/ui.dart';

import '../../controller/delete.dart';
import '../../weidgets/text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List noteDatas = [];

  //Model Api Use
  List<NoteModel> list = [];
  bool isLoading = false;

  dataFeatchs() async {
    isLoading = true;
    var data = await SetNoteData().getData();
    var list = ModelgetData().getModelApi();

    noteDatas = data;
    isLoading = false;
    log("$data");
    setState(() {});
  }

  @override
  void initState() {
    dataFeatchs();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: CustomTextwidget(Title: "My Noted", fS: 28),
      ),
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : noteDatas.isEmpty
          ? Center(child: CustomTextwidget(Title: "No Noted Available"))
          : ListView.builder(
              itemCount: noteDatas.length,
              itemBuilder: (context, index) => NoteCardWeigets(
                data: noteDatas[index],
                onDelete: () async {
                  await DeleteNoteApi().DeleteApi(id: noteDatas[index]['id']);
                  log("=========${noteDatas[index]['id']}===========");
                  dataFeatchs();
                },
                onEdit: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NoteAddEditScreen(
                        screenType: "Noted Edit",
                        noteTitle: "Title",
                        note: noteDatas[index]['note'],
                        id: noteDatas[index]['id'],
                      ),
                    ),
                  ).then((c){
                    dataFeatchs();
                  });
                },
              ),
            ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  NoteAddEditScreen(screenType: 'Note Add', noteTitle: "Title"),
            ),
          ).then((v) {
            dataFeatchs();
          }),
        },
        child: Icon(Icons.add_box),
      ),
    );
  }
}
