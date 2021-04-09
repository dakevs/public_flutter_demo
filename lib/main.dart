import 'package:flutter/material.dart';
import 'package:public_flutter_app/volunteer_signup_workflow.dart';

void main() async {
  final keyApplicationId = 'INSERT PARSE APPLICATION ID HERE';
  final keyClientKey = 'INSERT PARSE KEY CLIENT CODE HERE';
  final keyParseServerUrl = 'https://parseapi.back4app.com';



  
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      initialRoute: '/',
      routes: {
        '/': (context) => MyApp(),
         '/volunteer': (context) => VolunteerSignupRoute(),
        // '/requestChaperone': (context) => RequestChaperoneRouteLandingPage(),
        // '/requestChaperonePageTwo': (context) =>
        //     RequestChaperoneRoute_PageTwo(),
      }));

  // await Parse().initialize(keyApplicationId, keyParseServerUrl,
  //     clientKey: keyClientKey, autoSendSessionId: true);

  // var firstObject = ParseObject('FirstClass')
  //   ..set(
  //       'message', 'Hey ! First message from Flutter. Parse is now connected');
  // await firstObject.save();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    var aboutUsText =
        'We strive to provide the Oakland Chinatown Community with a resource for promoting safety and community.\n\n' +
            'We aim to embrace the often forgotten, underserved, and vulnerable. \n\nWe promote compassion not indifference, ' +
            'unity as opposed to divisiveness. Fostering a more caring and safer Oakland for all.';

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(
              color, Icons.follow_the_signs, 'Volunteer\nSign-Up', context),
          _buildButtonColumn(
              color, Icons.elderly, 'Chaperone\nRequest ', context),
        ],
      ),
    );

    Widget bodyTextRowSection = Container(
        padding: EdgeInsets.all(8),
        child: Text(
          aboutUsText,
          style: TextStyle(color: Colors.grey[700], fontSize: 16),
        ));

    return Scaffold(
      appBar: AppBar(
        title: Text('Compassion In Oakland', textAlign: TextAlign.center),
      ),
      body: ListView(
        children: [
          imageSection,
          aboutUsTitle,
          bodyTextRowSection,
          buttonSection
        ],
      ),
    );
  }
}

Widget imageSection = IntrinsicWidth(
  //stepHeight: 300,
    child: Image.asset(
      'images/CIO_LOGO.png',
      height: 300,
    ));

Widget aboutUsTitle = Container(
    child: Text(
      'About Us',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    ));

_showClickChaperoneButtonDialog(BuildContext context, String message){

  Widget okButton = TextButton(

      onPressed: () =>Navigator.pop(context),
      child: Text('OK'));


  AlertDialog alert = AlertDialog(
    title: Text("You clicked Chaperone Request"),
    content: Text("Demo showing you clicked on: " + '\n' + message),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}


Column _buildButtonColumn(
    Color color, IconData icon, String label, BuildContext context) {
  return Column(
    //mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      IconButton(
          iconSize: 50,
          icon: Icon(icon),
          color: color,
          onPressed: () {
            if (icon == Icons.follow_the_signs) {
              Navigator.pushNamed(context, '/volunteer');
            } else if (icon == Icons.elderly) {
              //Navigator.pushNamed(context, '/requestChaperone');
              _showClickChaperoneButtonDialog(context, "Chaperone");

            }
          }),
      Container(
        //margin: const EdgeInsets.only(top: 8),
          child: TextButton(
            child: Text(label,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: color,
                )),
            onPressed: () {
              if (icon == Icons.follow_the_signs) {
                Navigator.pushNamed(context, '/volunteer');
              } else if (icon == Icons.elderly) {
                Navigator.pushNamed(context, '/requestChaperone');
              }
            },
          )),
    ],
  );
}

