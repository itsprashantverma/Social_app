import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:social_app/Constants/constants.dart';
import 'package:social_app/Feed/new_post.dart';
import 'package:social_app/Profile/profile_page.dart';

class FeedPageWidget extends StatefulWidget {
  FeedPageWidget({Key key}) : super(key: key);

  @override
  _FeedPageWidgetState createState() => _FeedPageWidgetState();
}

class _FeedPageWidgetState extends State<FeedPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
        title: Align(
          alignment: Alignment(0, 0),
          child: Text(
            'Socail-TU',
            style: GoogleFonts.getFont(
              'Pacifico',
              color: Color(0xFFF4F4F4),
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: [
          // Profile Screen Route
          Align(
            alignment: Alignment(0, 0),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        child: DetailsWidget(),
                        type: PageTransitionType.rightToLeft),
                  );
                },
                child: FaIcon(
                  FontAwesomeIcons.home,
                  color: Color(0xFFF4F4F4),
                  size: 30,
                ),
              ),
            ),
          )
        ],
        centerTitle: true,
        elevation: 4,
      ),
      // New Post Button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
              child: AddPostWidget(),
              type: PageTransitionType.bottomToTop,
            ),
          );
        },
        backgroundColor: kSecondaryColor,
        icon: Icon(
          Icons.post_add,
          color: kQuartaryColor,
        ),
        elevation: 8,
        label: Text(
          'Post',
          style: GoogleFonts.getFont(
            'Montserrat',
            fontSize: bodyText1,
            color: kQuartaryColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Color(0xFFC8BFBF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // User Profile Pic
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Container(
                        width: 40,
                        height: 40,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: // TODO: Fetch the user profile pic
                            Image.network(
                          'https://picsum.photos/seed/379/600',
                        ),
                      ),
                    ),
                    // User name
                    Align(
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text(
                          // TODO: Fetch the user name
                          'User Name',
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            fontSize: bodyText1,
                            color: kSecondaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                // Actual post
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: BoxDecoration(
                      color: kQuartaryColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: // TODO: Fetch the actual post
                          Text(
                        'This space is for any kind of text that user want to post on the feed ',
                        style: GoogleFonts.getFont(
                          'Montserrat',
                          fontSize: bodyText1,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
