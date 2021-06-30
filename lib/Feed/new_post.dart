import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_app/Constants/constants.dart';

class AddPostWidget extends StatefulWidget {
  AddPostWidget({Key key}) : super(key: key);

  @override
  _AddPostWidgetState createState() => _AddPostWidgetState();
}

class _AddPostWidgetState extends State<AddPostWidget> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appBar,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Title
            Align(
              alignment: Alignment(0, 0),
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
                child: Text(
                  'Write your thought here',
                  style: GoogleFonts.getFont(
                    'Montserrat',
                    color: kTertiaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            // Text Field
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: TextFormField(
                controller: textController,
                obscureText: false,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: kSecondaryColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: kSecondaryColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  filled: true,
                ),
                style: GoogleFonts.getFont(
                  'Montserrat',
                  fontSize: bodyText1,
                ),
                maxLength: 170,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
              ),
            ),
            // Post Button
            Container(
              width: 100,
              height: 35,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(5),
                shape: BoxShape.rectangle,
              ),
              child: Align(
                alignment: Alignment(0, 0),
                child: Text(
                  'POST',
                  style: GoogleFonts.getFont(
                    'Montserrat',
                    color: kQuartaryColor,
                    fontSize: bodyText1,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
