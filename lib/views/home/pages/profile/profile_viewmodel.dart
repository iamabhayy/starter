import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';

class ProfileViewModel extends BaseViewModel {

  User? get getUser => FirebaseAuth.instance.currentUser;
}