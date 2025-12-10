

import 'dart:convert';
import 'dart:developer';

import 'package:mynoteds/model/note_model.dart';
import 'package:http/http.dart' as http;

class ModelgetData{

  Future<List<NoteModel>> getModelApi() async{

    try{
      Uri Url = Uri.parse("https://appapi.coderangon.com/api/notes");
      var response = await http.get(Url);

      if(response.statusCode==200){
        var data = jsonDecode(response.body)['notes'];
        log("========================${data}==================Data Nipon");
        List<NoteModel> listModel = [];

        for(var i in data){
          var  m = NoteModel.fromJson(i);
          listModel.add(m);
        }
        return listModel;
      }
    }
        catch(e){
      log("Error:=============== $e");
        }

        return [] ;
  }

}