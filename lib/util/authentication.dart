//import 'dart:async';
//import 'package:google_sign_in/google_sign_in.dart';
////import 'package:firebase_analytics/firebase_analytics.dart';
////import 'package:firebase_analytics/observer.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//
//class Auth {
//  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//  //static final FirebaseAnalytics firebaseAnalytics = new FirebaseAnalytics();
//  //static final FirebaseAnalyticsObserver firebaseAnalyticsObserver =
//  //    new FirebaseAnalyticsObserver(analytics: firebaseAnalytics);
//  static final GoogleSignIn googleSignIn = new GoogleSignIn();
//
//  static Future<String> getAccessToken() async {
//    return await firebaseAuth
//        .currentUser()
//        .then((currentUser) => currentUser.getIdToken());
//  }
//
//  static Future<Map<String, String>> getAuthHeaders() async {
//    return {'Authorization': 'Bearer ' + await getAccessToken()};
//  }
//}
//
//Future<FirebaseUser> signInWithGoogle() async {
//  // Attempt to get the currently authenticated user
//  GoogleSignInAccount currentUser = Auth.googleSignIn.currentUser;
//  if (currentUser == null) {
//    // Attempt to sign in without user interaction
//    currentUser = await Auth.googleSignIn.signInSilently();
//  }
//  if (currentUser == null) {
//    // Force the user to interactively sign in
//    currentUser = await Auth.googleSignIn.signIn();
//  }
//
//  //Auth.firebaseAnalytics.logLogin();
//
//  final GoogleSignInAuthentication _auth = await currentUser.authentication;
//
//  // Authenticate with firebase
//  final FirebaseUser user = await Auth.firebaseAuth.signInWithGoogle(
//    idToken: _auth.idToken,
//    accessToken: _auth.accessToken,
//  );
//
//  assert(user != null);
//  assert(!user.isAnonymous);
//
//  return user;
//}
//
//Future<Null> signOutWithGoogle() async {
//  // Sign out with firebase
//  await Auth.firebaseAuth.signOut();
//  // Sign out with google
//  await Auth.googleSignIn.signOut();
//}
//
///*
//final googleSignIn = new GoogleSignIn();
////final analytics = new FirebaseAnalytics();
//final auth = FirebaseAuth.instance;
//
//Future<Null> _ensureLoggedIn() async {
//  GoogleSignInAccount user = googleSignIn.currentUser;
//  if (user == null)
//    user = await googleSignIn.signInSilently();
//  if (user == null) {
//    user = await googleSignIn.signIn();
//    //analytics.logLogin();
//  }
//  if (await auth.currentUser() == null) {
//    GoogleSignInAuthentication credentials =
//    await googleSignIn.currentUser.authentication;
//    await auth.signInWithGoogle(
//      idToken: credentials.idToken,
//      accessToken: credentials.accessToken,
//    );
//  }
//}
//*/
