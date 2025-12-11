import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class DeleteNoteApi{
  
  Future DeleteApi({required int id}) async{
    try{
      Uri url = Uri.parse("https://appapi.coderangon.com/api/notes/delete/$id");
      var response = await http.delete(url);

      if(response.statusCode ==200){
        EasyLoading.showSuccess("Deleted Success");
        return ;
      }else if(response.statusCode ==404){
        EasyLoading.showError("Already Deleted or wrong Id");
      }


    }
        catch(e){
      log("Error:  $e");
        }
  }
}