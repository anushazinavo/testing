// import 'dart:convert';

// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:http/http.dart' as http;

// class ApiServices {
//   final razorPayKey = dotenv.get("");
//   final razorPaySecret = dotenv.get("");

//   razorPayApi(num amount, String recieptId) async {
//     var auth =
//         'Basic ' + base64Encode(utf8.encode('$razorPayKey:$razorPaySecret'));
//     var headers = {'content-type': 'application/json', 'Authorization': auth};
//     var request =
//         http.Request('POST', Uri.parse('https://api.razorpay.com/v1/orders'));
//     request.body = json.encode({
//       "amount": amount * 100, 
//       "currency": "INR", 
//       "receipt": recieptId 
//     });
//     request.headers.addAll(headers);

//     http.StreamedResponse response = await request.send();
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       return {
//         "status": "success",
//         "body": jsonDecode(await response.stream.bytesToString())
//       };
//     } else {
//       return {"status": "fail", "message": (response.reasonPhrase)};
//     }
//   }
// }



import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://192.168.1.24:5000/api/data';

  Future<Map<String, dynamic>> getData() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}