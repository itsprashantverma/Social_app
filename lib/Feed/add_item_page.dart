import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_app/Constants/constants.dart';

class AddItemsWidget extends StatefulWidget {
  AddItemsWidget({Key key}) : super(key: key);

  @override
  _AddItemsWidgetState createState() => _AddItemsWidgetState();
}

class _AddItemsWidgetState extends State<AddItemsWidget> {
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
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: true,
        title: Align(
          alignment: Alignment(0, 0),
          child: Text(
            'Social-TU',
            style: GoogleFonts.getFont(
              'Pacifico',
              color: Color(0xFFF4F4F4),
              fontSize: bodyText1,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: Align(
          alignment: Alignment(0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
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
                      controller: textController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Item Name',
                        labelStyle: GoogleFonts.getFont(
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
                                'Add item to List',
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
