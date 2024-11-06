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
}
