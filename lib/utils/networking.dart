import 'package:http/http.dart' as http;
import 'dart:convert';


class NetworkHelper{
  NetworkHelper(this.url);
  final String url;

  Future getData() async{
    // String url =
    //     'https://script.googleusercontent.com/macros/echo?user_content_key=_uhxbiZKQVMMW133t0kWUYR0WJ1-053tYNJ4oXeptuRsCcBq-JE83v0Y0YnXtRf313hnQAEWHUTA9Au-dZKUNHhzSO5tHxrMm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnEMN-zh0MoXhD6QwzfnXLvmgn1ztwnXAuOud510C3ADO8hGrCJ5-ylW8yjlylX2zuecZD2Tj-nphSqr3Lna9kEF685rtVaJn39z9Jw9Md8uu&lib=M5V3tlZP-JrLBTkkZR0r6U5ftSUq-N7sx';
    http.Response response = await http.get(Uri.parse(url));

    String data = response.body;
    return jsonDecode(data);

  }
}