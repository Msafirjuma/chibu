import 'package:get_storage/get_storage.dart';

class Preferences {
  final datacount = GetStorage();

  final companyName = 'COMPANYNAME';
  final address = 'ADDRESS';
  final companyImage = 'COMPANYIMAGE';

  final token = 'TOKEN';
  final apppassword = 'APPPASSWORD';
  final checkPassword = 'CHECKPASSWORD';

  void saveCompanyName(String value) async {
    await datacount.write(companyName, value);
  }

  Future<String> getCompanyName() async {
    return await datacount.read(companyName) ?? '';
  }

  void saveAddress(String value) async {
    await datacount.write(address, value);
  }

  Future<String> getAddress() async {
    return await datacount.read(address) ?? '';
  }

  void saveCompanyImage(String value) async {
    await datacount.write(companyImage, value);
  }

  Future<String> getCompanyImage() async {
    return await datacount.read(companyImage) ?? '';
  }

  void saveToken(String value) async {
    await datacount.write(token, value);
  }

  void saveCheckPassword(bool value) async {
    await datacount.write(checkPassword, value);
  }

  Future<String> getToken() async {
    return await datacount.read(token) ?? '';
  }

  void saveAppPassword(String appPassword) async {
    await datacount.write(apppassword, appPassword);
  }

  Future<String> getAppPassword() async {
    return await datacount.read(apppassword) ?? '';
  }

  Future<bool> getCheckPassword() async {
    return await datacount.read(checkPassword) ?? false;
  }

  void clearToken() async {
    await datacount.remove(token);
    await datacount.remove(apppassword);
    await datacount.remove(checkPassword);
  }
}
