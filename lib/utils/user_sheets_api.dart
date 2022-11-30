import 'package:gsheets/gsheets.dart';
import 'package:catalogapp/utils/feedbacks.dart';

class UserSheetsApi {
  static const _credentials = r'''
  {
  "type": "service_account",
  "project_id": "taapmaan-370202",
  "private_key_id": "3e264d94ac3142264d5f44bcb77f08828ad5bc36",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQC4bqt/ZbRw1TJz\nErpQqh6CJiU9RkwZZ3BYQqjr03uzB5o+wLsbBnG1x5D6iU5CEYm9BDgx/tOGZNyO\nz58XwVHextLzXkGkITPLdbPsQyN+qUziVR/45YOeTw9VHuuG5MJKCmByTXrBmEpy\n9nV6Yzd8rbeYO+LOo4zt68D6TgPfzoa1c83dapUeogcuGBu9Ls6X9CD3KelL/OqJ\nXUXCfO8lBta9vypyfB82zD3rq08fGn+0XvnZOVetHExAH3Y9EqEFROVngcnufBTF\nD2QIimhyqtc7JiQNn486tEB7PibA7CbZ2aZO/8wVs+1a0n0yAi+Np3qPZoRoWZp3\n7p/POR+xAgMBAAECggEACsnCc1nGI8F8yXljd5tz3GYR0JM/mU7RJgCENAMzXaYI\nsjoA19RZK2pogxcsAjZXabyI8ve2dMqKkjn30uJmgRL9POobCdg9WN3iL+Q/e8W4\nbxbOn3cBa22xdmewHDxeVwljWdxJXXCkjjP3bDjIgp0Au8FpA3BSqoobSCjvFhS7\neZ16h1aJ0VWA+th6cI8mdZ96jx3f8Ft0ni1zxteTG7ilLTIJObsXGKX89xRSaV8f\nWDAe4fGXDHMJozXuFED8a85hi8DgGCGfyG5Qj3NFkstWydSRpGYT6dm33VZGy/MS\nrcPGQhKCp/oI3ODvZvaTXCCwjcK8FGAU4X3KU3N/qQKBgQD0I4/VeDzplqSFHYP0\n7spEKt4QRwQOF29PabZzvI92g2fN7/5MyAlAzWqLzrF92HLmUI0j0jkHd+vjHpnF\nJmGpTYFv3+c+SMUMlXo+ZPyDaWfol5spp286+HxsrgVSkGHKw0wLumZXZxG46POo\nBV8KNOCzu8YX4HBfODnQ9aDWrQKBgQDBZIRMe62+PPEZduNVUNdEWyBnZSifuPNy\nWIKHWAKCmFr1lPFrhX+aFH+9MbEYURHuclAttG4Q9vphTRdrSqQ8A5JaPcAnE56p\nwXTTg/qLLf8C/s6Pnt68o9/lwv7J0tt0gcVlkU8udtOQ1x85FWZBLirvIaxBLvut\nzfgRPwuBlQKBgQCeFTjZfRXUGxtEpqv/OW/3W9qWp6VUipAk18qwfnRWxRe+HZyI\nky6Kq3hGNvxvBGzB/X6mp0UONPSlB/eB1Sx/uBQMIOtXRT9yuoeBR1rKrMH/tcte\n2XAIu0W2CaigoaTw6iyfm38RMUgkd5LuRSwZK8wkFX5bj5Sz03B8gdA3sQKBgQC0\n8t/20CIYxdyw/tRml2VTyA/hrnz8NYlTjA1VpbtzhipVbi8Vc6uY92UuGLijD/e/\nK6ZpnVD+/pf3QrKO6SASJyVg2jZYWbszCpfM8MgUQc1BeDi9mOC/kHWF/ZV4MZq0\nwFd6WSPFTdlWxHGqb6NliVUSumb59oP2c6mQOXUCoQKBgQCV4Gu+cGBxJvcDciIu\ncxq9NcKLlTDFADQBrDfs7Jg3kJnJUoyAvQ/Xw/6+Dh7DO2NFxzF2ZHRns75FSy94\nxo/c45IyjG9gXbkRpG/V0RvttAWP5ricEDbYYN4A3BMeguJEPeeggBPHVUcDJX6c\n5afCY2ArbevpgCJKIyT/WvrHuw==\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@taapmaan-370202.iam.gserviceaccount.com",
  "client_id": "103177088515134355292",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40taapmaan-370202.iam.gserviceaccount.com"
}
''';
  static const _spreadsheetId = '1I8WPqMvoS8EK_hv2K_30F-oyDKUKlWLWSFHCNAaLvmc';

  static final _gsheets = GSheets(_credentials);

  static Worksheet? _userSheet;

  static Future init() async {
    try{
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _userSheet = await _getWorkSheet(spreadsheet, title: "Req");
      final firstRow = FeedbackFields.getColumns() ;
      _userSheet!.values.insertRow(1,firstRow);
    }
    catch(e){
      print(e);
    }
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String  title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.addWorksheet(title)!;
    }
  }

  static Future insert(List<Map<String,dynamic >> rowList) async{
    _userSheet!.values.map.appendRows(rowList);
  }
}
