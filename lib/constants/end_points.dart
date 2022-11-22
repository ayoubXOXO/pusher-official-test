class ApiEndPoints {
  static const _createToken = "/users/create-token";
  static const _signIn = "/users/sign-in";
  static const _signOut = "/users/logout";
  static const _recoverPassword = "/users/recover-password";
  static const _askQuestion = "/emails/ask-question";
  static const _signUp = "/users/sign-up";
  static const _authNotifications = '/notifications/auth';

  //Profile
  static const _getMyProfile = '/users/get-my-profile';
  static const _updateProfile = '/users/update-profile';

  //Common
  static const _manageUploadAvatar = '/common/manage-upload-avatar';

  //External
  static const _s3Url = "s3-eu-west-1.amazonaws.com";

  get createToken => _createToken;
  get signIn => _signIn;
  get signOut => _signOut;
  get recoverPassword => _recoverPassword;
  get askQuestion => _askQuestion;
  get signUp => _signUp;
  get getMyProfile => _getMyProfile;
  get updateProfile => _updateProfile;
  get manageUploadAvatar => _manageUploadAvatar;
  get s3Url => _s3Url;
  get authNotifications => _authNotifications;
}
