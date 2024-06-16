import 'package:cnfaceattendance/data/local/preferences.dart';
import 'package:cnfaceattendance/data/remote/dio_client/dio_client.dart';
import 'package:cnfaceattendance/data/remote/network_url/network_url.dart';
import 'package:cnfaceattendance/data/remote/response/updatecompanydetails_response.dart';
import 'package:cnfaceattendance/utils/exceptionhandler.dart';
import 'package:dio/dio.dart';

class UpdateCommpanyDetailsRepository {
  final preferences = Preferences();
  final dioclient = DioClient();

  void saveCompanyDetail(String companyName, String address, String image) {
    preferences.saveCompanyName(companyName);
    preferences.saveAddress(address);
    preferences.saveCompanyImage(image);
  }

  Future<CompanyUpdateDetailsResponse> updateCompanydetailsFromApi(
    String image,
    String name,
    String address,
    String primaryemail,
    String secondaryemail,
    String primarycontactno,
  ) async {
    try {
      String token = await preferences.getToken();
      final formData = FormData.fromMap({
        'name': name,
        'address': address,
        'primary_email': primaryemail,
        'secondary_email': secondaryemail,
        'primary_contact_no': primarycontactno,
        'image': image.isEmpty
            ? ''
            : await MultipartFile.fromFile(image, filename: 'userImage.jpg'),
      });
      final response = await dioclient.postForImageUpload(updatecompanydetailsUrl,
          formData, {'Authorization': 'Bearer $token'});

      return CompanyUpdateDetailsResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw exceptionHandler(e);
    } catch (e) {
      rethrow;
    }
  }
}
