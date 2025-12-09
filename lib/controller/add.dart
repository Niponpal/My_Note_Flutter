import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class NoteAddAPI{
 static Future<void> addNoteData({required String data}) async{
    try{
      Uri url = Uri.parse("https://appapi.coderangon.com/api/notes/add");
      var body = {
        'note':data
      };
      var header = {
        "Accept": "application/json"
      };
      var response =await http.post(url,headers:header, body: body);

      if(response.statusCode==200){

        log("Status Code: ${response.statusCode}");
        log("Response Body: ${response.body}============================");

        EasyLoading.showSuccess("Note Added");
        return ;
      }
      else{
        EasyLoading.showError("Something Wrang");
      }
    }
        catch(e){
      log("Error: ${e}");
        }
  }
}