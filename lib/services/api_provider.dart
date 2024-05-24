import 'dart:convert';
import 'dart:developer' as developer;
import 'package:fmp_test/utils/constants.dart';
import 'package:http/http.dart' as http;

enum apiMethod {
  get,
  post,
  delete,
  update,
}

class ApiServices {
  static final client = http.Client();
  static Future execute({
    required apiMethod method,
    required String url,
    var data,
    String? accessToken,
  }) async {
    developer.log(data.toString());
    try {
      var response;
      switch (method) {
        case apiMethod.get:
          print('https://asapapi.srvinfotech.com/$url');
          response = await client.get(
              Uri.parse(
                '${AppConstants.getbaseUrl()}$url',
              ),
              headers: accessToken != null
                  ? {
                      'x-access-token': accessToken,
                    }
                  : {});

          break;
        case apiMethod.post:
          developer.log("post");
          response =
              await client.post(Uri.parse('${AppConstants.getbaseUrl()}$url'),
                  body: json.encode(data),
                  headers: accessToken != null
                      ? {
                          'x-access-token': accessToken,
                          'Content-Type': 'application/json',
                          'Accept': 'application/json',
                        }
                      : {
                          'Content-Type': 'application/json',
                          'Accept': 'application/json',
                        });

          break;
        case apiMethod.delete:
          break;
        case apiMethod.update:
          break;
      }

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      } else {
        // throw Exception('Failed to load data');
      }
    } catch (e) {
      // AppSnackbars.errorSnackbars(e.toString());
      developer.log(e.toString());
    }
  }
}