
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart'  as http;


class SetNoteData{

  Future<List> getData() async{

    try{
      Uri Url = Uri.parse("https://appapi.coderangon.com/api/notes");
      var response = await http.get(Url);

      if(response.statusCode== 200){
        var data = jsonDecode(response.body)['notes'];

        return data;
      }
    }
        catch(e){
        log("Error: $e");
        }

        return [];
  }

}