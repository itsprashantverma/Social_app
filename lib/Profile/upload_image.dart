import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:social_app/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:social_app/Feed/feed_screen.dart';

class UploadProfilePic extends StatefulWidget {
  @override
  _UploadProfilePicState createState() => _UploadProfilePicState();
}

class _UploadProfilePicState extends State<UploadProfilePic> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool isUploading = false;

  File _imageFile;

  Future<void> getImage() async {
    final picker = ImagePicker();
    PickedFile result = await picker.getImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxHeight: 300,
      maxWidth: 300,
    );
    setState(() {
      _imageFile = File(result.path);
    });
  }

  Future<void> uploadImage(BuildContext context) async {
    firebase_storage.Reference ref;
    firebase_storage.FirebaseStorage _storage =
        firebase_storage.FirebaseStorage.instance;
    setState(() {
      isUploading = true;
    });
    ref =
        _storage.ref().child('image/' + FirebaseAuth.instance.currentUser.uid);
    await ref.putFile(_imageFile).whenComplete(() async {
      await ref.getDownloadURL().then((value) async {
        await FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser.uid)
            .collection("imageURL")
            .doc(FirebaseAuth.instance.currentUser.uid)
            .set({"url": value}).then((value) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => FeedPageWidget()),
              (route) => false);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appBar,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Image picker Button
                  Align(
                    alignment: Alignment(0, 0),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
                      child: GestureDetector(
                        onTap: () {
                          getImage();
                        },
                        child: Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            color: kSecondaryColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          alignment: Alignment(0, 0),
                          child: Align(
                            alignment: Alignment(0, 0),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: Text(
                                      'Select an Image from gallery',
                                      style: GoogleFonts.getFont(
                                        'Montserrat',
                                        color: Colors.white,
                                        fontSize: bodyText1,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //Image
                  (_imageFile != null)
                      ? Align(
                          alignment: Alignment(0, 0),
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Container(
                              child: Image.file(
                                _imageFile,
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  // Upload Image Button
                  Align(
                    alignment: Alignment(0, 0),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: GestureDetector(
                        onTap: () {
                          HapticFeedback.mediumImpact();
                          uploadImage(context);
                        },
                        child: Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            color: kSecondaryColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          alignment: Alignment(0, 0),
                          child: Align(
                            alignment: Alignment(0, 0),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: Text(
                                      'Upload Image',
                                      style: GoogleFonts.getFont(
                                        'Montserrat',
                                        color: Colors.white,
                                        fontSize: bodyText1,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            (isUploading)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
