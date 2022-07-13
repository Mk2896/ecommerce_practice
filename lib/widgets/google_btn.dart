import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_practice/global_constant.dart';
import 'package:ecommerce_practice/models/user.dart';
import 'package:ecommerce_practice/screens/home_page.dart';
import 'package:ecommerce_practice/widgets/custom_text.dart';
import 'package:ecommerce_practice/widgets/loading.dart';
import 'package:ecommerce_practice/widgets/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loader_overlay/loader_overlay.dart';

class GoogleButton extends StatelessWidget {
  GoogleButton({
    Key? key,
    required this.text,
    this.bottomMargin,
    this.topMargin,
    this.rightMargin,
    this.leftMargin,
    this.height,
    this.width,
    required this.successMessage,
  }) : super(key: key);
  final double? leftMargin;
  final double? rightMargin;
  final double? topMargin;
  final double? bottomMargin;
  final double? width;
  final double? height;
  final String text;
  final String successMessage;

  CollectionReference userRef =
      FirebaseFirestore.instance.collection('users').withConverter<Users>(
            fromFirestore: (snapshot, _) => Users.fromJson(snapshot.data()!),
            toFirestore: (user, _) => user.toJson(),
          );

  Future<void> signInWithGoogle(BuildContext context) async {
    context.loaderOverlay.show(widget: const Loading(loadingText: "Loading.."));
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
        User? currentUser = FirebaseAuth.instance.currentUser;

        Users? currentUserDB = await userRef
            .doc(currentUser!.uid)
            .get()
            .then((DocumentSnapshot snapshot) => snapshot.data() as Users?);

        if (currentUserDB == null) {
          userRef
              .doc(currentUser.uid)
              .set(Users(
                name: currentUser.displayName!,
                email: currentUser.email!,
                profilePath: currentUser.photoURL!,
              ))
              .onError((error, stackTrace) =>
                  snackBar(error.toString(), const Color(errorColor), context));
        }

        snackBar(successMessage, const Color(successColor), context);

        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
      }
    } on FirebaseAuthException catch (e) {
      snackBar(e.message, const Color(errorColor), context);
    } catch (e) {
      snackBar(e.toString(), const Color(errorColor), context);
    }

    context.loaderOverlay.hide();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: leftMargin ?? 0,
        right: rightMargin ?? 0,
        top: topMargin ?? 0,
        bottom: bottomMargin ?? 0,
      ),
      width: width ?? MediaQuery.of(context).size.width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(const Color(secondaryColor)),
        ),
        onPressed: () => signInWithGoogle(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 30,
              child: Image(image: AssetImage("assets/images/google_logo.png")),
            ),
            Padding(
              padding: const EdgeInsets.only(left: horizontalPadding),
              child: CustomText(
                text: text,
                textColor: const Color(secondaryFontColor),
                textType: TextType.heading3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
