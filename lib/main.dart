import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('My awesome profile'),
        ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MyPortfolio(),
                Text(
                  'My skills:',
                  style: Theme.of(context).textTheme.display1,
                ),
                MySkills(),
              ]),
        ),
      ),
    );
  }
}

class MyPortfolio extends StatefulWidget {
  MyPortfolio({Key key}) : super(key: key);

  @override
  _MyPortfolioState createState() => _MyPortfolioState();
}

class _MyPortfolioState extends State<MyPortfolio> {
  String _firstName = 'Anton Shevchuk';
  String _email = '301.shevchuk.anton@gmail.com';
  String _address = 'Peremogy 99';
  String _githubRepositoryUrl = 'https://github.com/301shevchukanton';
  String _avatarUrl =
      'https://avatars3.githubusercontent.com/u/12715545?s=460&v=4';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                _firstName,
                style: Theme.of(context).textTheme.body2,
              )),
          Text(
            '$_email',
            style: Theme.of(context).textTheme.body2,
          ),
          Text(
            '$_address',
            style: Theme.of(context).textTheme.body2,
          ),
          new FlatButton(
            onPressed: () async {
              if (await canLaunch(_githubRepositoryUrl)) {
                await launch(_githubRepositoryUrl);
              } else {
                throw 'could not launch url';
              }
            },
            child: Text(
              '$_githubRepositoryUrl',
              style: Theme.of(context).textTheme.body2,
            ),
          ),
          Image.network(
            _avatarUrl,
          )
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MySkills extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MySkillsState();
  }
}

class _MySkillsState extends State<MySkills> {
  List<String> _litems = [
    "Java",
    "Kotlin",
    "Jira",
    "CI/CD",
    "Project management"
  ];
  final TextEditingController _textEdittingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      new TextField(
        controller: _textEdittingController,
        onSubmitted: (text) {
          _litems.add(text);
          _textEdittingController.clear();
          setState(() {});
        },
      ),
      ListView.separated(
          separatorBuilder: (context, index) => Divider(
                color: Colors.black,
              ),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _litems.length,
          itemBuilder: (BuildContext ctxt, int Index) {
            return Padding(
                padding: const EdgeInsets.only(left: 50),
                child: new Text(_litems[Index],
                    style: Theme.of(context).textTheme.display1));
          })
    ]);
  }
}
