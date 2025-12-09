
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;


class NoteUpdate{
  
  NoteUpdateApi ({required int id,required String Title}) async {
    try{
      Uri url = Uri.parse("https://appapi.coderangon.com/api/notes/update/$id");
      var header = {
        "Accept" : "application/json"
      };
      var body = {
        "note":Title
      };
      var response = await http.put(url,headers:header,body:body );
        if(response.statusCode==200){
          EasyLoading.showSuccess("Update Data");
        }
        else{
          EasyLoading.showError("Update Failed");
        }

    }
    
        catch(e){
          log("Error $e");
        }
  }
}