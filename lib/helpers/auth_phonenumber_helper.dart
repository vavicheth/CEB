import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
String _verificationId;

Future sendVerificationCode(String phoneNumber) {
  final verificationCompleted = (AuthCredential credential) {
    print("completed credential  ${credential.toString()}");
  };

  final verificationFailed = (AuthException authException) {
    print("error ${authException.toString()}");
  };

  final PhoneCodeSent codeSent =
      (String verificationId, [int forceResendingToken]) async {
    _verificationId = verificationId;
    print(
        "codeSent verificationId $verificationId and forceResendingToken $forceResendingToken");
  };

  final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
      (String verificationId) {
    _verificationId = verificationId;
    print("timeout $verificationId");
  };

  _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: Duration(seconds: 120),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
}

Future<bool> verifyCode(String smsCode) async {
  print("_verificationId $_verificationId");
  print("smsCode $smsCode");
  AuthCredential authCredential = PhoneAuthProvider.getCredential(
      verificationId: _verificationId, smsCode: smsCode);
  AuthResult result = await _auth.signInWithCredential(authCredential);
  FirebaseUser firebaseUser = result.user;
  print("firebaseUser ${firebaseUser.uid} and ${firebaseUser.phoneNumber}");
  if (firebaseUser != null && firebaseUser.uid != null) {
    return true;
  } else {
    return false;
  }
}
