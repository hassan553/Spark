import 'package:firebase_auth/firebase_auth.dart';

class FirebaseRepository {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static Future signInWithPhoneNumber({
    required String phone,
    required String code,
  }) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: '+2$phone',
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: (String verificationId, int? resendToken) {
        codeSentFrom(verificationId, resendToken, code);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

 static verificationCompleted(PhoneAuthCredential credential) async {
    await _auth.signInWithCredential(credential);
  }

 static verificationFailed(FirebaseAuthException e) async {
    if (e.code == 'invalid-phone-number') {
      print('The provided phone number is not valid.');
    }
  }

  static codeSentFrom(String verificationId, int? resendToken, String code) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: code);

    await _auth.signInWithCredential(credential);
  }
}
