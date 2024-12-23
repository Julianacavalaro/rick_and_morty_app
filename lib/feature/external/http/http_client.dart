
import 'package:http/http.dart';

abstract class HttpClient {
  Future get({required  String url});
}

class HttpClientImpl implements HttpClient {
  final client = Client();
  @override
  Future<dynamic> get({required String url}) async {
  return await client.get(Uri.parse(url),



   );
  }

}