class AppUrls {
  // static const String baseUrl = "http://192.168.0.158:9988/api/v1"; //!Local url
  static const String baseUrl = "https://medpocket-backend.vercel.app"; //!Live url

  static const String imageBaseUrl = 'https://medpocket-backend.vercel.app/uploads';

  static const String agencyToken = '';
  static const String b2bToken = '';

  //! Auth 
  static const String signup = '$baseUrl/api/auth/signup';
  static const String login = '$baseUrl/api/auth/login';
  static const String requestReset = "$baseUrl/api/auth/request-password-reset";
  static const String verifyOtp = "$baseUrl/public/otp/match";
  static const String resetPassword = "$baseUrl/btob/auth/reset-password";

  //!Profile
  static String profile({required String id}) => "$baseUrl/api/user/profile${"/$id"}";
  static String profileSetup({required String id}) => "$baseUrl/api/user/profile-setup${"/$id"}";

  //!Dashboard
  static String dashboard({required String id}) => "$baseUrl/api/home/dashboard${"/$id"}";
  static String measurements({required String id}) => "$baseUrl/api/health/add-measurement${"/$id"}";
  static String glucose({required String id}) => "$baseUrl/api/health/add-glucose/$id";
  static String daywiseGlucose({required String id, required int days}) => "$baseUrl/api/health/glucose-by-days/$id?days=$days";

  static String pressure({required String id}) => "$baseUrl/api/health/add-pressure/$id";
  static String daywisePressure({required String id, required int days}) => "$baseUrl/api/health/pressure-by-days/$id?days=$days";

  static String daywiseMeasurements({required String id, required int days}) => "$baseUrl/api/health/measurements-by-days/$id?days=$days";

  //!report
  static String reportFolder({String? id, String? userId, bool? create, bool? getAll, bool?update, bool? delete}) => "$baseUrl/api/folder${create==true?"/create-folder" : getAll == true ? "/all-folders/$userId" : update == true ? "/update-folder/$id" : delete == true ? "/delete-folder/$id" : ""}"; 

  static String reports({String? id,String? userId, String? folderId, bool? upload, bool? getAll, bool?update, bool? delete}) => "$baseUrl/api/report${upload==true?"/upload" : getAll == true ? "all-reports/$folderId?userId=$userId" : update == true ? "/update-report/$id" : delete == true ? "/delete-report/$id" : ""}"; 
}
/*
api/report/upload
api/report/update-report/678b4482d68571b2221b5dfd
api/report/all-reports/678a5ecefb7b736018d620fe?userId=671bca7f3c243fa0e37e9427
api/report/delete-report/678a5ecefb7b736018d620fe
*/