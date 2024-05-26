import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class FunctionsUtils{

  static launchUrls(url)async{
    print(url);
     if (!await launch(url)) {
        throw Exception('Could not launch $url');
      }
  }


 static convertUnixTimeToDesired(int time) {
    String formattedDateTime = DateFormat("dd-MM-yyyy HH:mm").format(
      DateTime.fromMillisecondsSinceEpoch(time), // No need to multiply by 1000 and then divide by 1000
    );
    return formattedDateTime.toString();
  }



  static Map<dynamic,dynamic> getTimeDifference(String dateTimeString) {
    DateTime now = DateTime.now();
    DateTime targetDateTime = DateTime.parse(dateTimeString);
    Duration difference = targetDateTime.difference(now);
    Map data={};
    int days = difference.inDays;
    int hours = difference.inHours.remainder(24);
    int mins=difference.inMinutes;

    String formattedDifference = '';

    if (days > 0) {
      formattedDifference += '${days} Days ';
      data['time']=formattedDifference+"Left";
      data['enable']=false;
    }
    if (hours > 0) {
      formattedDifference += '${hours}hrs ';
      data['time']=formattedDifference+"Left";
      data['enable']=false;
    }

    if (days <= 0 && hours <= 0) {
      formattedDifference = '$mins'+"mins.";
      if(mins<0){
        data['time']="Claim Now";
        data['enable']=true;
      }else{
        data['time']=formattedDifference+"Left";
        data['enable']=true;
      }

    }

    return data;
  }



    showId(myId){
    var prefix = "LC002501";


    // Extracting numeric portion from the prefix
    var numericPart = int.parse(prefix.replaceAll(RegExp(r'[^0-9]'), ''));

    // Adding the value of myId
    var newNumericPart = numericPart + int.parse(myId);

    // Constructing the new ID
    return  prefix.replaceAll(RegExp(r'[0-9]+'), newNumericPart.toString()).toString();

  }

  static String taskType(id){
    String type="Refer";
    switch(id) {
      case "0":
        {
          type = "Daily CheckIn";
          break;
        }
      case "1":
        {
          type = "Refer";
          break;
        }
      case "2":
        {
          type = "Register or Subscribe";
          break;
        }
      case "3":
        {
          type = 'Visit Task';
          break;
        }
      default:{
        type="Invalid Task";
        break;
      }
    }
    return type;
  }
}