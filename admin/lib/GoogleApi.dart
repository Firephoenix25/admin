import 'package:gsheets/gsheets.dart';

// your google auth credentials

const _credentials = r'''
{
  "type": "service_account",
  "project_id": "data-visitor-303914",
  "private_key_id": "0cea041b16ccb93333e29ed1e64fb205e7891305",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCa6PY509JcHgw0\nB0BZgZKa9DyIn5c8yU2UgJrrhkC9yTqe7ynCXEq3qz1zf0af6Yr6hG2+k6I+MkKU\nSak6A9+I3YTy3jYYXYc+Jhyf4zIME8B82k4o3fIPI1oF0/basvUV58OX72Yh0RiW\nqsQd9t2eu2zvVCWeG6oSu7Cx8RkFnNqPIBBxJvulhBueNKpOxBEH5Q60GmCUIUnW\nda50hNSfcwGAKLU6aqC/gPbgWfYrj75z6S5mfe94AzzZZ4p1mQeXrSheWK9iQ+74\nImsZ6ZSBrkqd9OOuIhhQu/6fOpFwNvXeb3tKobv2PeLTiqT35Pil+/gzlKDNOYh3\n+KS7v2pLAgMBAAECggEAKeRUKgFBgw3RKQTI/yuONP9Vm3DlGlgp9b3tp0HQIkLX\n6oEs3tXMkuzpGmHR/I7Quby0XPRZzM4UuTtOW1UOz1lwialUIbSxTTpLRWXQc/mn\ndVwoBN84haV+w9K1kCETLFBX0a+5A+4i4yPdE2leN33iELrFzYMXtCczuntD1ANS\nUQ0mgXOf05ohTUYX+L+a/LZmoeYzSOFFHxZdkbMBqu62+3k/3hIRZoy5DmBSDq3c\nDeYwpvjDmSu66ucBHTyG4qEzYhF6giIBlzcpiOj+8/IM2Lvs7sACraWm12FJLwVE\nnNm3Vp9CqyNJZW+zFNLjrDKEEMndzGjtOkGqI+DUUQKBgQDLHazxU+FCnnIdCTGv\n2tDHrY+0tpY4FR/f6936TuqkiU8pz1MmodHcwrh4WRsDZMvlcOLO4lbo4v/xOU3C\nufz2fBbvTbVczrd92Ia2XxjCtNquSuplM/ahRCSIqE5yV0NNV+O6gEYwj502/iIz\nacObyrLqHza835LsbylWts7y4wKBgQDDPjVR5H027DRCGrRLqYf3uOzEsAJqO15K\nubv24SucHipmzeD2l4deGfWUzOCelFN1drjMUwj8wsD+bMBpa9LH5pazC4MeD86o\n1S3jU6GECB8K+PB/rklQzhmVlUaQmRUd+N6TPfZ43OKsxsnsDS9D/w/LDXpLUW/8\nUaBIO9B/eQKBgB8FPDlrHxcGjdUDZ3Q9De/BARaPYCfWihSvuCoXTVytn8p54HAg\n/KUjk/rFWQvOpBk5gVopVS6iJIaZwtd/gjO+xd3sV0uCQqHUpNZLdcOezVsbE+s6\n4WrFtnKsibaKvzubtarxFkcqV89jRqPlfjtX3LVG6Rw1ZQH5BC47IyYTAoGBAJoj\nE38qbrwccAk8Adi153TnlmyVM+LgKcm+pij6jS48FmeA47hp2mGtBtdJg49ONDFI\n4A3XBAJgUnLKMoFHsWlFnvWNAh+KhTF+0zJjxOBydOd5roxucM0NWN9hsQrY//Xg\nkv8VbO7wGzgh3CmyIv2AcNxyMHkjutAtNOex6SGpAoGAZrsJ+PpvyZOUdrR9l48i\nbEm5T6mOGel6/U2Jjm8YugjK1o8GEfG4Xl9vgn2GZPTuq5ClzDVH2va84rBOJc+x\nUUJiE3wXsrwQzhqjsfK0MyaSyMovCx92kCQJe5GgXp0AxJ2WSjjxt5RnZDo72D9A\n2RGzdkTgDhjoV4CX9n+vc1U=\n-----END PRIVATE KEY-----\n",
  "client_email": "cc-2500@data-visitor-303914.iam.gserviceaccount.com",
  "client_id": "113934644993413475115",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/cc-2500%40data-visitor-303914.iam.gserviceaccount.com"
}
''';
// your spreadsheet id
const _spreadsheetId = '1R5POV7IEYzRjEb7SBkMgGVmzmS_ABmwMspjLSTBYsVs';

// init GSheets
final gsheets = GSheets(_credentials);

Future<List<List<String>>> reading() async {
  // fetch spreadsheet by its id
  try {
    final ss = await gsheets.spreadsheet(_spreadsheetId);
    // get worksheet by its title
    var sheet = ss.worksheetByTitle('Sheet1');
    List<List<String>> list = await sheet.values.allRows(length: 10);

    return list;
  } catch (e) {
    print(e);

    return [];
  }
}
