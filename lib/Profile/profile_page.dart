import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_app/Constants/constants.dart';

class DetailsWidget extends StatefulWidget {
  @override
  _DetailsWidgetState createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  TextEditingController userNameController;
  TextEditingController phoneNumberController;
  TextEditingController departmentController;
  TextEditingController semesterController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    phoneNumberController = TextEditingController();
    departmentController = TextEditingController();
    semesterController = TextEditingController();
    checkDoc();
    getImageURL();
  }

  Map data;
  bool isLoading;
  String imageURL;

  void getImageURL() async {
    var db = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("imageURL")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get();

    imageURL = db.data()["url"];
  }

  void checkDoc() async {
    var db = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get();

    if (db.exists != null) {
      data = db.data();
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appBar,
      body: (isLoading == null)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // User Image
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: Container(
                        width: 150,
                        height: 150,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          imageURL.toString(),
                        ),
                      ),
                    ),
                    // User Name Text Field
                    Align(
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(4, 0, 0, 20),
                        child: Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFFE0E0E0),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: TextFormField(
                              initialValue: data["name"],
                              controller: userNameController,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'User Name',
                                hintStyle: GoogleFonts.getFont(
                                  'Open Sans',
                                  color: Color(0xFF455A64),
                                  fontWeight: FontWeight.normal,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                              style: GoogleFonts.getFont(
                                'Open Sans',
                                color: Color(0xFF455A64),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Phone Number Form Field
                    Align(
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(4, 0, 0, 20),
                        child: Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFFE0E0E0),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: TextFormField(
                              initialValue: data["phone"],
                              controller: phoneNumberController,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Phone Number',
                                hintStyle: GoogleFonts.getFont(
                                  'Open Sans',
                                  color: Color(0xFF455A64),
                                  fontWeight: FontWeight.normal,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                              style: GoogleFonts.getFont(
                                'Open Sans',
                                color: Color(0xFF455A64),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Department
                    Align(
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(4, 0, 0, 20),
                        child: Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFFE0E0E0),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: TextFormField(
                              initialValue: data["dept"],
                              controller: departmentController,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Department',
                                hintStyle: GoogleFonts.getFont(
                                  'Open Sans',
                                  color: Color(0xFF455A64),
                                  fontWeight: FontWeight.normal,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                              style: GoogleFonts.getFont(
                                'Open Sans',
                                color: Color(0xFF455A64),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Semester
                    Align(
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(4, 0, 0, 20),
                        child: Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFFE0E0E0),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: TextFormField(
                              initialValue: data["sem"],
                              controller: semesterController,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Semester',
                                hintStyle: GoogleFonts.getFont(
                                  'Open Sans',
                                  color: Color(0xFF455A64),
                                  fontWeight: FontWeight.normal,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                              style: GoogleFonts.getFont(
                                'Open Sans',
                                color: Color(0xFF455A64),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
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
                                      'CONFIRM',
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
                    Text(
                      'OR',
                      style: GoogleFonts.getFont(
                        'Montserrat',
                        color: kPrimaryColor,
                        fontSize: bodyText1,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            color: kTertiaryColor,
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
                                      'Log out',
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
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
