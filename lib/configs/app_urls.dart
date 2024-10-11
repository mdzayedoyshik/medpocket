class AppUrls {
  // static const String baseUrl = "http://192.168.0.158:9988/api/v1"; //!Local url
  static const String baseUrl = "http://192.168.0.244:9008/api/v1"; //!Local url

  static const String imageBaseUrl = 'https://medpocket-backend.vercel.app/uploads';

  static const String agencyToken = '';
  static const String b2bToken = '';

  //! Auth 
  static const String login = '$baseUrl/btob/auth/login';
  static const String sendOtp = "$baseUrl/public/otp/send";
  static const String verifyOtp = "$baseUrl/public/otp/match";
  static const String resetPassword = "$baseUrl/btob/auth/reset-password";

}
