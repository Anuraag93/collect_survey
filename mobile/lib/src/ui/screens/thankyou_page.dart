import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:mobile/src/asset_constants.dart';
import 'package:mobile/src/ui/screens/load_survey_page.dart';
import 'package:url_launcher/url_launcher.dart';

class ThankyouPage extends StatelessWidget {
  final ThankyouScreen content;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const ThankyouPage({Key key, this.content, this.scaffoldKey})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Card(
        color: Colors.cyan.withOpacity(0.7),
        elevation: 5,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 100),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                content.title,
                style: theme.textTheme.title,
              ),
              SizedBox(height: 20),
              if (content.attachment != null) ...[
                _buildAttachment(),
                SizedBox(height: 20),
              ],
              if (content.properties?.showButton ?? false) ...[
                RaisedButton(
                  child: Text(content.properties.buttonText),
                  onPressed: () {
                    if (content.properties.buttonMode.toLowerCase() ==
                        "reload") {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  LoadSurveyPage()));
                    }
                    if (content.properties.buttonMode.toLowerCase() ==
                        "redirect") {
                      _launchURL();
                      Navigator.pop(context);
                    }
                  },
                ),
                SizedBox(height: 20)
              ],
              if (content.properties?.shareIcons ?? false) ...[
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {
                    scaffoldKey.currentState.removeCurrentSnackBar();
                    scaffoldKey.currentState.showSnackBar(SnackBar(
                      content: Text("Share Icon Pressed"),
                    ));
                  },
                ),
                SizedBox(height: 20)
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAttachment() {
    if (content.attachment.type.toLowerCase() == "image") {
      return Container(
        color: Colors.white,
        child: FadeInImage(
          height: 100,
          image: NetworkImage(content.attachment.href),
          placeholder: AssetImage(AssetConstants.kNoImage),
        ),
      );
    } else {
      return Container();
    }
  }

  _launchURL() async {
    const url = 'https://google.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
