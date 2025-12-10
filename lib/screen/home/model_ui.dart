

import 'package:flutter/material.dart';
import 'package:mynoteds/controller/modelget.dart';
import 'package:mynoteds/model/note_model.dart';

import '../../weidgets/text.dart';

class ModelUiScreeb extends StatefulWidget {
  const ModelUiScreeb({super.key});

  @override
  State<ModelUiScreeb> createState() => _ModelUiScreebState();
}

class _ModelUiScreebState extends State<ModelUiScreeb> {

  List<NoteModel> list = [];

  modelFeathData () async{
    
  await  Future.delayed(Duration (seconds: 3));
    list= await ModelgetData().getModelApi();
   setState(() {

   });
  }

  @override

  @override
  void initState() {
    modelFeathData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: CustomTextwidget(Title: "My Noted", fS: 28),
      ),
      body: ListView.builder(
        itemCount: list.length,
          itemBuilder: (context, index) => Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text( "Id: ${list[index].id.toString()}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Note: ${list[index].note.toString()}",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Created At:  ${list[index].createdAt.toString()}",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Updated At:  ${list[index].updatedAt.toString()}",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          )



      ),

    );
  }
}
