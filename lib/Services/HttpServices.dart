import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../Api/EndPoints.dart';
import '../Utils/app_config.dart';

class HttpServices{
 Map<String,String> header={
   "Content-Type":"application/json",
   "Access-Control-Allow-Origin": "*",
   'Accept': '*/*',
   "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",

 };

   Future<Response>getServices(endPoint,)async{
     return await http.get(Uri.parse(AppConfig.apiBaseUrl+endPoint));
  }

  Future<Response>postServices({endPoint,body})async{
     print(body);
    return await http.post(Uri.parse(AppConfig.apiBaseUrl+endPoint),body: body,headers: header);
  }

  Future<Response>putServices({endPoint,body})async{
    return await http.put(Uri.parse(AppConfig.apiBaseUrl+endPoint),body: body,headers: header);
  }

  uploadService({File? fileBuffer})async{
    try {
      var request = http.MultipartRequest('POST', Uri.parse(AppConfig.apiBaseUrl+""));
      request.files.add(await http.MultipartFile.fromPath('image', fileBuffer!.path));

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        print('Image uploaded successfully');
        return response;
      } else {
        print('Failed to upload image. Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
    return ;
  }

}