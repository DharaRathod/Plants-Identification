import 'package:flutter/material.dart';

class AppInfo extends StatefulWidget {
  @override
  _AppInfoState createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              'App Info',
              style: TextStyle(color: Colors.black),
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Container(
                  child: Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Opacity(
                            opacity: 0.82,
                            child: Image(
                              width: 75,
                              height: 75,
                              image: AssetImage(
                                'assets/images/playstore.png',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'PLANTEEX v1.0',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Identifiez vos plantes InstantanĂ©ment',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    image: DecorationImage(
                        // colorFilter: ColorFiltered(colorFilter: C),
                        scale: 0.1,
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/splash.jpg')),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Material(
                  elevation: 5.0,
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(children: [
                        TextSpan(
                          text:
                              'Vous ne connaissez pas le nom d\'une plante ? Planteex vous aide Ă  identifier les plantes'
                              'que vous ne connaissez pas, Ă  dĂ©couvrir de belles plantes et Ă  les partager de la maniĂ©re la plus'
                              'simple et la plus intĂ©ressante qui soit. \n',
                          style: TextStyle(color: Colors.black54, fontSize: 18),
                        ),
                        TextSpan(
                          text: 'Nous avons travaillĂ© dur pour vous offrir '
                              'une meilleure expĂ©rience utilisateur et pour optimiser notre algorithme de reconnaissance '
                              'des plantes ! Nous n\'aurions pas pu rĂ©ussir sans vos suggestions et votre aide et '
                              'nous vous en remercions. \n',
                          style: TextStyle(color: Colors.black54, fontSize: 18),
                        ),
                        TextSpan(
                          text:
                              'Nous aimerions Ă©galement que quiconque aime les plantes se joigne Ă  notre famille. '
                              'CommenĂ§ons ensemble un voyage Ă  la dĂ©couverte des plus belles plantes du monde.',
                          style: TextStyle(color: Colors.black54, fontSize: 18),
                        ),
                      ]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Material(
                  elevation: 5.0,
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  child: Container(
                    height: 50,
                    child: Center(
                      child: Text('Developed đŸ–¤ By: @brakenseddik'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
